<!-- 修改商品组件 -->
<template>
  <div style="margin-top: 50px">
    <el-form :model="value" :rules="rules" ref="productInfoForm" label-width="120px" style="width: 600px" size="small">

      <el-form-item label="商品名称：" prop="name">
        <el-input v-model="value.name" :disabled="disabled"></el-input>
      </el-form-item>
      <el-form-item label="市场价：" prop="name">
        <el-input v-model="value.marketPrice" :disabled="disabled"></el-input>
      </el-form-item>
      <el-form-item label="库存：" prop="name">
        <el-input v-model="value.soldNum" :disabled="disabled"></el-input>
      </el-form-item>
      <el-form-item label="销售价：" prop="name">
        <el-input v-model="value.shopPrice" :disabled="disabled"></el-input>
      </el-form-item>
      <el-form-item label="是否免运费：" prop="name">
    
        <el-switch
                :active-value="true"
                :inactive-value="false"
              :disabled="disabled"
                v-model="value.shipFree">
              </el-switch>
      </el-form-item>
      <el-form-item label="商品封面：">
        <div>
          <img
          :key="index"
          :src="value.goodsFrontImage"
          style="width: 80px; height: 80px; margin-right: 10px; margin-bottom: 15px;"
          >
        </div>
      </el-form-item>

      <el-form-item label="商品分类：" prop="brand">
        <el-select
          v-model="value.first_cate"
          @change="handleCateChange"
          :disabled="disabled"
          placeholder="请选择一级分类">
          <el-option
            v-for="item in selectProductCateValue"
            :key="item.parent"
            :label="item.name"
            :value="item.parent">
          </el-option>
        </el-select>
        <el-select
          v-model="value.second_cate"
          @change="handleSecondCateChange"
          v-if="value.first_cate"
          :disabled="disabled"
          placeholder="请选择二级分类">
          <el-option
            v-for="item in selectProductSecondCateValue"
            :key="item.parent"
            :label="item.name"
            :value="item.parent">
          </el-option>
        </el-select>
        <el-select
          v-model="value.third_cate"
          @change="handleThirdCateChange"
          :disabled="disabled"
          v-if="value.second_cate"
          placeholder="请选择三级分类">
          <el-option
            v-for="item in selectProductThirdCateValue"
            :key="item.parent"
            :label="item.name"
            :value="item.parent">
          </el-option>
        </el-select>
      </el-form-item> 
      <el-form-item label="商品品牌：" prop="brandId">
        <el-select
          v-model="value.brand"
          @change="handleBrandChange"
          :disabled="disabled"
          placeholder="请选择品牌">
          <el-option
            v-for="item in brandOptions"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="商品相册：">
        <template>
          <div>
            <img
              v-for="(image, index) in value.images"
              :key="index"
              :src="image.url"
              style="width: 80px; height: 80px; margin-right: 10px; margin-bottom: 15px;"
            >
            </img>
          </div>
        </template>
        
      </el-form-item>
      <el-form-item label="商品简介：" prop="name">
        <el-input v-model="value.goodsBrief"  type="textarea" :disabled="disabled"></el-input>
      </el-form-item>
      <el-form-item label="商品详情图片：">
        <template>
          <div>
            <img
              v-for="(image, index) in value.descImages"
              :key="index"
              :src="image.url"
              style="width: 80px; height: 80px; margin-right: 10px; margin-bottom: 15px;"
            >
            </img>
          </div>
        </template>
        
      </el-form-item>
      <el-form-item style="text-align: center">
        <el-button type="primary" v-if="!disabled" size="medium" @click="finishCommit('productInfoForm')">确认</el-button>
        <el-button type="primary" v-else size="medium" @click="edit()">编辑</el-button>
      </el-form-item>

    </el-form>
  </div>
</template>

<script>
  import {fetchListWithChildren} from '@/api/productCate'
  import {fetchList as fetchBrandList} from '@/api/brand'
  import {getGoodsEach,getCategorys,getBrands,putGoods,createGoods,getBrandsByCate } from '@/apis/goods'

  // import MultiUpload from '@/components/Upload/multiUpload'

  export default {
    // name: "ProductInfoDetail",
    // props: {
    // },
    // components: {MultiUpload},

    data() {
      return {
      

        hasEditCreated:false,
        selectProductCateValue: [],
        selectProductSecondCateValue:[],
        selectProductThirdCateValue:[],
        id: {
          id:""
        },
        value:{
          images:[],
          brand:{}
        },
        shipList:[
          {
            value:true,
            label: '是'
          },{
            value:false,
            label: '否'
          }
        ],
        img1:[],
        img2:[],
        img3:[],
        selectProductPics:[],
        disabled: false,
        isEdit: false,
        imgList:[],
        productCateOptions: [],
        brandOptions: [],
        category:{
          id:"",
        },
        getOne:{
          id:0
        },
        brand:{
          id:""
        },
        rules: {
          name: [
            {required: true, message: '请输入商品名称', trigger: 'blur'},
            {min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur'}
          ],
          subTitle: [{required: true, message: '请输入商品副标题', trigger: 'blur'}],
          productCategoryId: [{required: true, message: '请选择商品分类', trigger: 'blur'}],
          brandId: [{required: true, message: '请选择商品品牌', trigger: 'blur'}],
          description: [{required: true, message: '请输入商品介绍', trigger: 'blur'}],
          requiredProp: [{required: true, message: '该项为必填项', trigger: 'blur'}]
        }
      };
    },
    created() {
      this.getProductCateList();
      console.log("??????????",this.$route.query)

      this.initData()
      this.getBrandsList()
    },
    computed:{
      //商品的编号
      productId(){
        return this.value.id;
      }
    },
    watch: {
      value:function(val) {
        console.log(val)
      },
      productId:function(newValue){
        if(!this.isEdit)return;
        if(this.hasEditCreated)return;
        if(newValue===undefined||newValue==null||newValue===0)return;
        this.handleEditCreated();
      },
    },
    methods: {
      //处理编辑逻辑
      handleEditCreated(){
        if(this.value.productCategoryId!=null){
          this.selectProductCateValue.push(this.value.cateParentId);
          this.selectProductCateValue.push(this.value.productCategoryId);
        }
        this.hasEditCreated=true;
      },
      multiInput(file) {
        console.log('tupian', this.value.images)
        this.img1 = file
        this.value.images = file.map(item=> {
          return item.url
        })
        // this.$forceUpdate()
        this.images_imgs = this.value.images_imgs

      },
      multiInput2(file) {
        this.img2 = file

        console.log('tupian222', this.value)
        this.value.desc_images = file.map(item=> {
          return item.url
        })
        // this.value.desc_images = file
        this.$forceUpdate()
        this.desc_images = this.value.desc_images

      },
      multiInput3(file) {
        this.img3 = file

        console.log('tupian333', this.value)
        this.value.front_image = file.map(item=> {
          return item.url
        })
        this.$forceUpdate()
        // this.front_image = this.value.front_image
          console.log("bobby1")
          console.log(this.value.front_image)
          console.log(this.value.front_image[0])
          console.log("bobby2")
          this.value.front_image = this.value.front_image[0]

      },
      handleCateChange(data) {
        console.log("datatada",data)
        // this.selectProductSecondCateValue = data
        this.value.category =data
        this.selectProductCateValue.forEach(res=> {
          if(res.parent == data) {
            this.selectProductSecondCateValue = res.subCategory
          }
        })
          this.getBrandsBy(data)

      },
      handleSecondCateChange(data) {
        this.value.category =data

        this.selectProductSecondCateValue.forEach(res=> {
          if(res.parent == data) {
            this.selectProductThirdCateValue = res.subCategory
          }
        })
          this.getBrandsBy(data)
      },
      handleThirdCateChange(data) {
        this.value.category =data

          this.getBrandsBy(data)

      },
      getBrandsBy(id) {
        this.getOne.id=id;
        getBrandsByCate(this.getOne).then(res=> {
          this.brandOptions = res.data.list
          console.log("brandddd",this.brandOptions)
        })
      },
      // 初始化数据
      initData() {
        if(this.$route.query.id) {
          this.disabled = true;
          this.isEdit = true
        }
        //  else {
        //   this.disabled = false;
        //   this.isEdit = false
        // }
      },
      edit() {
        this.disabled = false
      },
      getProductCateList() {
        getCategorys().then(response => {
          let list = response.data.list;
          console.log('分类', response)
          this.selectProductCateValue = response.data.list
          if(this.$route.query.id) {

            this.id.id = this.$route.query.id
          this.getGoods();
          }
        });
      },
      getBrandsList() {
        getBrands().then(response => {
          let list = response.data.list;
          console.log('品牌', response)
          this.brandOptions = response.data.list
        });
      },
      getGoods() {
        getGoodsEach(this.id).then(response => {
          this.value.images
          console.log("Goods",response.data)
          this.images_imgs = response.images||[]
          this.desc_imgs = response.desc_images||[]
          this.value = response.data
          this.value.brand = response.data.brandsId
          this.value.images = JSON.parse(response.data.images).map(item=> {
            return {url: item}
          })
           this.value.descImages = JSON.parse(response.data.descImages).map(item=> {
            return {url: item}
          })
          this.value.goodsFrontImage=json.parse(response.data.goodsFrontImage).map(item=>{
            return {url:item}
          })

          this.img1 = this.value.images
          this.img2 = this.value.descImages
          this.img3 = this.value.goodsFrontImage
          // 处理分类
      
          let targetId = response.categoryId
          console.log("selectProductCateValue",this.selectProductCateValue)
        });
      },
      getCateNameById(id){
        let name=null;
        for(let i=0;i<this.productCateOptions.length;i++){
          for(let j=0;j<this.productCateOptions[i].children.length;j++){
            if(this.productCateOptions[i].children[j].value===id){
              name=this.productCateOptions[i].children[j].label;
              return name;
            }
          }
        }
        return name;
      },
      handleNext(formName){
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$emit('finishCommit');
          } else {
            this.$message({
              message: '验证失败',
              type: 'error',
              duration:1000
            });
            return false;
          }
        });
      },
      finishCommit() {
        // this.value.images = this.images_imgs
        // this.value.desc_images= this.desc_imgs
        this.value.shopPrice = Number(this.value.shopPrice)||0
        this.value.stocks = Number(this.value.stocks)||0
        this.value.marketPrice = Number(this.value.marketPrice)||0
        // this.value.desc_images = this.images_imgs
        // this.value.front_image = this.images_imgs[0]
        // this.value.desc='sdfsdfdsfdf'
        this.value.category=this.value.third_cate||this.value.second_cate||this.value.first_cate
        this.value.images=this.value.images.map(image=>image.url)
        this.value.descImages=this.value.descImages.map(image=>image.url)
        console.log("this.value.images",this.value.images)
        console.log("this.value.descImages",this.value.descImages)
        delete this.value.first_cate
        delete this.value.second_cate
        delete this.value.third_cate
        if(this.isEdit) {
          putGoods(this.value).then(res=> {
            this.$notify({
                title: '提示',
                message: '修改成功',
                type: 'success'
                });
            this.$router.push('/product')
          }).catch(err=> {
            this.$notify({
                title: '提示',
                message: err.msg,
                type: 'success'
                });
          })
        }else {
          createGoods(this.value).then(res=> {
            console.log('sdfsdfsdf')
             this.$notify({
                title: '提示',
                message: '新建成功',
                type: 'success'
                });
            this.$router.push('/product')
          }).catch(err=> {
            console.log('cuowu')
            this.$notify({
                title: '提示',
                message: err.msg,
                type: 'success'
                });
          })
        }
      },
      handleBrandChange(val) {
        // let brandName = '';
        // for (let i = 0; i < this.brandOptions.length; i++) {
        //   if (this.brandOptions[i].value === val) {
        //     brandName = this.brandOptions[i].label;
        //     break;
        //   }
        // }
        // this.value.brandName = brandName;
      }
    }
  }
</script>

<style scoped lang="scss">

/deep/.el-select{
  width: 150px;
}
</style>