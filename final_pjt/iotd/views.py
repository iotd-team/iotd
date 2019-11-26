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

        BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

        modelnum = request.POST.get('modelnum')
        prdlink = request.POST.get('prdlink')

        # 링크
        link = prdlink

        # 사이트명
        if prdlink.split("/")[2].split(".")[1] == '11st':
            retailer = "11번가"
        elif prdlink.split("/")[2].split(".")[1] == 'coupang':
            retailer = "Coupang"
        else:
            return render(request, 'crawling.html')

        # 현재 크롬 드라이버
        driver_path = os.path.join(BASE_DIR, 'selenium_drivers', 'chromedriver', 'chromedriver.exe')
        
        driver = webdriver.Chrome(driver_path)
        driver.get(prdlink)

        # 11번가 크롤링
        if retailer == "11번가":

            # 제품명
            productName = driver.find_element_by_class_name('heading').find_element_by_tag_name('h2').text

            # 썸네일
            thumbnail_url = driver.find_element_by_id('thumb').find_element_by_tag_name('img').get_attribute('src')

            # 가격
            price = driver.find_element_by_class_name('sale_price').text + '원'

            # 리뷰 개수
            reviewnum_origin = driver.find_element_by_id('reviewTo').find_element_by_class_name('notice_count').text
            reviewnum0 = re.sub('[ ,\(\)]', '', reviewnum_origin)
            reviewnum = '리뷰 ' + reviewnum0 + '건'

            # 별점
            try:
                rating5 = driver.find_element_by_id('prdRating').find_element_by_class_name('num').text
                rating = '판매자 평점 별5개 중 ' + rating5 + '개'
            except:
                rating = '판매자 평점 별5개 중 0.0개'

        # 쿠팡 크롤링
        elif retailer == "Coupang":

            # 제품명
            productName = driver.find_element_by_class_name('prod-buy-header__title').text

            # 썸네일
            thumbnail_url = driver.find_element_by_class_name('prod-image__detail').get_attribute('src')

            # 가격
            price = driver.find_element_by_class_name('prod-coupon-price').find_element_by_class_name('total-price').text
            if price == "":
                price = driver.find_element_by_class_name('prod-sale-price').find_element_by_class_name('total-price').text

            # 리뷰 개수
            reviewnum_origin = driver.find_element_by_class_name('prod-buy-header__productreview').find_element_by_class_name('count').text
            if reviewnum_origin == "":
                reviewnum = '리뷰 0건'
            else:
                reviewnum0 = re.sub('[^0-9]', '', reviewnum_origin)
                reviewnum = '리뷰 ' + reviewnum0 + '건'

            # 별점
            rating_origin = driver.find_element_by_class_name('rating-star-num').get_attribute('style')
            rating100 = re.sub('[^0-9]', '', rating_origin)
            rating = '판매자 평점 별5개 중 ' + str(int(rating100)/100*5) + '개'

        else:
            return render(request, 'crawling.html')

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

        driver.close()

        return redirect('iotd:index')
    else:
        return render(request, 'crawling.html')