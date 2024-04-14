import request from '@/utils/request'
let userUrl = "http://127.0.0.1:8081"
export function login(params) {
  return request({
    url:userUrl+'/user/login',
    method:'post',
    data:params
  })
}

export function createBrand(data) {
  return request({
    url:'/brands/add',
    method:'post',
    data:data
  })
}
export function updateShowStatus(data) {
  return request({
    url:'/brands/update/showStatus',
    method:'post',
    data:data
  })
}

export function updateFactoryStatus(data) {
  return request({
    url:'/brands/update/factoryStatus',
    method:'post',
    data:data
  })
}

export function deleteBrand(id) {
  return request({
    url:'/brands/delete/',
    method:'post',
    data: id
  })
}

export function getBrand(id) {
  return request({
    url:'/brands/getBrand',
    method:'post',
    data: id
  })
}

export function updateBrand(id,data) {
  return request({
    url:'/brands/update/',
    method:'post',
    data:data
  })
}

