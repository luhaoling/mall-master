import request from '@/utils/request'
export function fetchList(params) {
  return request({
    url:'/categoryBrands/list',
    method:'post',
    params:params
  })
}

export function createProductAttrCate(data) {
  return request({
    url:'/categoryBrands/create',
    method:'post',
    data:data
  })
}

export function deleteProductAttrCate(id) {
  return request({
    url:'/categoryBrands/delete/',
    method:'post',
    data:id
  })
}

export function updateProductAttrCate(id,data) {
  return request({
    url:'/categoryBrands/update/',
    method:'post',
    data:data
  })
}
export function fetchListWithAttr(data) {
  return request({
    url:'/categoryBrands/getSubCategoryBrand',
    method:'post',
    data:data
  })
}
