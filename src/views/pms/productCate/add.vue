<!-- 添加分类品牌关系 -->
<template> 
  <product-cate-detail :is-edit='false'></product-cate-detail>
</template>
<script>
  import ProductCateDetail from './components/ProductCateDetail'
  export default {
    name: 'addProductCate',
    components: { ProductCateDetail }
  }
</script>
<style>
</style>


