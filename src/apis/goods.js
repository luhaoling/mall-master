import request from '@/utils/request'

// 原来
// let host = 'http://shop.projectsedu.com';
// // let baseUrl = "http://39.107.30.137:8000"
// let goodsUrl = "http://124.223.201.78:8022"
// let orderUrl = "http://124.223.201.78:8023"
// let userUrl = "http://124.223.201.78:8021"
// let userOpUrl = "http://124.223.201.78:8027"
// export let ossUrl = "http://124.223.201.78:8029"

let host = 'http://shop.projectsedu.com';
// let baseUrl = "http://39.107.30.137:8000"
let goodsUrl = "http://127.0.0.1:8084"
let orderUrl = "http://127.0.0.1:8082"
let userUrl = "http://127.0.0.1:8081"
// let userOpUrl = "http://127.0.0.1:8027"
// export let ossUrl = "http://124.223.201.78:8029"

// 分类
export function getCategorys(params) {
  return request({
    url:goodsUrl+'/category/list',
    method:'post',
    params:params
  })
}
export function login(params) {
  return request({
    url:userUrl+'/user/login',
    method:'post',
    data:params
  })
}

export function getCategoryDetail(id) {
  return request({
    url:goodsUrl+'/g/v1/categorys/'+id,
    method:'get'
  })
}
export function postCategorys(params) {
  return request({
    url:goodsUrl+'/category/add',
    method:'post',
    data:params
  })
}
export function putCategorys(params) {
  return request({
    url:goodsUrl+'/category/update',
    method:'post',
    data:params
  })
}
export function deleteCategorys(params) {
  return request({
    url:goodsUrl+'/category/delete',
    method:'post',
    data:params
  })
}
// 品牌
export function getBrands(params) {
  return request({
    url:goodsUrl+'/brands/all',
    method:'post',
    data:params
  })
}
export function getBrandsByCate(params) {
  return request({
    url:goodsUrl+'/categoryBrands/getSubCategoryBrand',
    method:'post',
    data:params
  })
}
export function createBrand(data) {
  return request({
    url:goodsUrl+'/brands/add',
    method:'post',
    data:data
  })
}
export function putBrands(params) {
  return request({
    url:goodsUrl+'/brands/update',
    method:'post',
    data:params
  })
}
export function deleteBrands(id) {
  return request({
    url:goodsUrl+'/brands/delete',
    method:'post',
    data:id
  })
}
// 品牌+分类关系
export function getBrandToCate(params) {
  return request({
    url:goodsUrl+'/categoryBrands/list',
    method:'post',
    data:params
  })
}

export function getBrandToCateDetail(id,params) {
  return request({
    url:goodsUrl+'/categoryBrands'+id,
    method:'get',
    params:params
  })
}
export function createBrandToCate(data) {
  return request({
    url:goodsUrl+'/categoryBrands/add',
    method:'post',
    data:data
  })
}
export function putBrandToCate(params) {
  return request({
    url:goodsUrl+'/categoryBrands/update',
    method:'post',
    data:params
  })
}
export function deleteBrandToCate(id) {
  return request({
    url:goodsUrl+'/categoryBrands/delete',
    method:'post',
    data:id
  })
}
// 商品管理
export function getGoods(params) {
  return request({
    url:goodsUrl+'/goods/list',
    method:'post',
    data:params
  })
}

export function searchGood(params){
  return request({
    url:goodsUrl+'/goods/search',
    method:'post',
    data:params
  })
}
export function getGoodsEach(params) {
  return request({
    url:goodsUrl+'/goods/getGoods',
    method:'post',
    data:params

  })
}

export function createGoods(data) {
  return request({
    url:goodsUrl+'/goods/add',
    method:'post',
    data:data
  })
}
export function putGoods(params) {
  return request({
    url:goodsUrl+'/goods/update',
    method:'post',
    data:params
  })
}
export function deleteGoods(params) {
  return request({
    url:goodsUrl+'/goods/delete',
    method:'post',
    data:params
  })
}
export function putGoodsStatus(params) {
  return request({
    url:goodsUrl+'/goods/updateStatus',
    method:'post',
    data:params
  })
}



// 订单
export function getOrder(params) {
  return request({
    url:orderUrl+'/order/getAllOrders',
    method:'post',
    data:params
  })
}
export function getOrderEach(params) {
  return request({
    url:orderUrl+'/order/getGoods',
    method:'post',
    data:params
  })
}

export function createOrder(data) {
  return request({
    url:orderUrl+'/orders',
    method:'post',
    data:data
  })
}
export function putOrder(id,params) {
  return request({
    url:orderUrl+'/orders/'+id,
    method:'put',
    data:params
  })
}
export function deleteOrder(id,params) {
  return request({
    url:orderUrl+'/orders/'+id,
    method:'delete',
    data:params
  })
}

// 留言
export function getMessage(params) {
  return request({
    url:userOpUrl+'/up/v1/message',
    method:'get',
    params:params
  })
}

export function createMessage(data) {
  return request({
    url:userOpUrl+'/message',
    method:'post',
    data:data
  })
}
export function putMessage(id,params) {
  return request({
    url:userOpUrl+'/message/'+id,
    method:'put',
    data:params
  })
}
export function deleteMessage(id,params) {
  return request({
    url:userOpUrl+'/message/'+id,
    method:'delete',
    data:params
  })
}
// 收藏
export function getuserfav(params) {
  return request({
    url:userOpUrl+'/userfav',
    method:'get',
    params:params
  })
}

export function createuserfav(data) {
  return request({
    url:userOpUrl+'/userfav',
    method:'post',
    data:data
  })
}
export function putuserfav(id,params) {
  return request({
    url:userOpUrl+'/userfav/'+id,
    method:'put',
    data:params
  })
}
export function deleteuserfav(id,params) {
  return request({
    url:userOpUrl+'/userfav/'+id,
    method:'delete',
    data:params
  })
}
//用户地址、
export function getaddress(params) {
  return request({
    url:userOpUrl+'/up/v1/address',
    method:'get',
    params:params
  })
}
export function getaddressEach(params) {
  return request({
    url:userOpUrl+'/address',
    method:'get',
    params:params
  })
}

export function createaddress(data) {
  return request({
    url:userOpUrl+'/address',
    method:'post',
    data:data
  })
}
export function putaddress(id,params) {
  return request({
    url:userOpUrl+'/address/'+id,
    method:'put',
    data:params
  })
}
export function deleteaddress(id,params) {
  return request({
    url:userOpUrl+'/address/'+id,
    method:'delete',
    data:params
  })
}

// 用户列表

export function getUserList(params) {
  return request({
    url:userUrl+'/user/getUserList',
    method:'post',
    data:params
  })
}
export function updateShowStatus(data) {
  return request({
    url:'/brand/update/showStatus',
    method:'post',
    data:data
  })
}

export function updateFactoryStatus(data) {
  return request({
    url:goodsUrl+'/brand/update/factoryStatus',
    method:'post',
    data:data
  })
}

export function deleteBrand(id) {
  return request({
    url:goodsUrl+'/brand/delete/'+id,
    method:'get',
  })
}

export function getBrand(id) {
  return request({
    url:goodsUrl+'/brands/getBrand',
    method:'post',
    data: id
  })
}

export function updateBrand(id,data) {
  return request({
    url:goodsUrl+'/brand/update/'+id,
    method:'post',
    data:data
  })
}


export function getBanners(params) {
  return request({
    url:goodsUrl+'/banner/list',
    method:'post',
    data:params
  })
}

export function createBanner(data) {
  return request({
    url:goodsUrl+'/banner/add',
    method:'post',
    data:data
  })
}
export function putBanner(params) {
  return request({
    url:goodsUrl+'/banner/update',
    method:'post',
    data:params
  })
}
export function deleteBanners(params) {
  return request({
    url:goodsUrl+'/banner/delete',
    method:'post',
    data:params
  })
}
