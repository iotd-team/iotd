from django.shortcuts import render, redirect
from selenium import webdriver
import os
from iotd.models import Item
import re

# Create your views here.

def index(request):
    return render(request, 'index.html')

def detail(request):
    pass

def crawling(request):
    if request.method == "POST":

        modelnum = request.POST.get('modelnum')
        prdlink = request.POST.get('prdlink')

        BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

        # 현재 크롬 드라이버
        driver_path = os.path.join(BASE_DIR, 'selenium_drivers', 'chromedriver', 'chromedriver.exe')
        
        driver = webdriver.Chrome(driver_path)
        driver.get(prdlink)

        # 사이트명
        retailer = driver.find_element_by_xpath('//head//meta[@name="keywords"]').get_attribute('content')

        # 제품명
        productName = driver.find_element_by_class_name('heading').find_element_by_tag_name('h2').text

        # 링크
        link = prdlink

        # 썸네일
        thumbnail_url = driver.find_element_by_id('thumb').find_element_by_tag_name('img').get_attribute('src')

        # 가격
        price = driver.find_element_by_class_name('sale_price').text + '원'

        # 리뷰 개수
        reviewnum_origin = driver.find_element_by_id('reviewTo').find_element_by_class_name('notice_count').text
        reviewnum = re.sub('[ ,\(\)]', '', reviewnum_origin)

        # 별점
        try:
            rating = driver.find_element_by_id('prdRating').find_element_by_class_name('num').text
        except:
            rating = None

        product = Item(
            modelnum = modelnum,
            productName = productName,
            retailer = retailer,
            link = link,
            thumbnail_url = thumbnail_url,
            price = price,
            reviewnum = reviewnum,
            rating = rating
        )

        product.save()

        return redirect('iotd:index')
    else:
        return render(request, 'crawling.html')