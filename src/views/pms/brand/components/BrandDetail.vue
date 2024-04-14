<template> 
  <el-card class="form-container" shadow="never">
    <el-form :model="brand" :rules="rules" ref="brandFrom" label-width="150px">
      <el-form-item label="品牌名称：" prop="name">
        <el-input v-model="brand.name"></el-input>
      </el-form-item>
      <!-- <el-form-item label="品牌首字母：">
        <el-input v-model="brand.letter"></el-input>
      </el-form-item> -->
      <el-form-item label="品牌LOGO：" prop="logo">
        <!-- <single-upload v-model="brand.logo"></single-upload> -->
        <el-upload
          :action="useOss?host:minioUploadUrl"
          list-type="picture-card"
          :file-list="value"
          :before-upload="beforeUpload"
          :limit="maxCount"
          :on-exceed="handleExceed"
          :disabled="disabled"
          ref="load"
          :multiple="multiple"
        >
          <!-- :http-request="requestImg" -->
          <i class="el-icon-plus"></i>
        </el-upload>
      </el-form-item>
      <!-- <el-form-item label="品牌专区大图：">
        <single-upload v-model="brand.bigPic"></single-upload>
      </el-form-item>
      <el-form-item label="品牌故事：">
        <el-input
          placeholder="请输入内容"
          type="textarea"
          v-model="brand.brandStory"
          :autosize="true"></el-input>
      </el-form-item> -->
      <!-- <el-form-item label="排序：" prop="sort">
        <el-input v-model.number="brand.sort"></el-input>
      </el-form-item> -->
      <!-- <el-form-item label="是否显示：">
        <el-radio-group v-model="brand.showStatus">
          <el-radio :label="1">是</el-radio>
          <el-radio :label="0">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="品牌制造商：">
        <el-radio-group v-model="brand.factoryStatus">
          <el-radio :label="1">是</el-radio>
          <el-radio :label="0">否</el-radio>
        </el-radio-group>
      </el-form-item> -->
      <el-form-item>
        <el-button type="primary" @click="onSubmit('brandFrom')">提交</el-button>
        <el-button v-if="!isEdit" @click="resetForm('brandFrom')">重置</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>
<script>
  import {createBrand, putBrands,getBrand} from '@/apis/goods'
  import SingleUpload from '@/components/Upload/singleUpload'
  const defaultBrand={
    letter: '',
    logo: '',
    name: '',
    sort: 0
  };
  export default {
    name: 'BrandDetail',
    components:{SingleUpload},
    props: {
      edit: {
        type: Boolean,
        default: false
      }
    },
    data() {
      return {
        brand:Object.assign({}, defaultBrand),
        isEdit: false,
        rules: {
          name: [
            {required: true, message: '请输入品牌名称', trigger: 'blur'},
          ],
        },
        updateBrand:{
          id:"",
          name:"",
          logo:""

        },
        getBrand:{
          id:"",
        }
      }
    },
    created() {
      if(this.$route.query.id) {
        this.isEdit=true
      } else {
        this.isEdit =false
      }
      console.log('编辑平拍')
      if (this.isEdit) {
        this.getBrand.id=this.$route.query.id
        getBrand(this.getBrand).then(response => {
          this.brand = response.data;
        });
      }else{
        this.brand = Object.assign({},defaultBrand);
      }
    },
    methods: {
      beforeUpload(file) {
        let _self = this;
          _self.dataObj.name = file.name
        if(!this.useOss){
          //不使用oss不需要获取策略
          return true;
        }
        console.log('文件名',file)
      },
      onSubmit(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$confirm('是否提交数据', '提示', {
              confirmButtonText: '确定',
              cancelButtonText: '取消',
              type: 'warning'
            }).then(() => {
              if (this.isEdit) {
                this.updateBrand.id=this.$route.query.id;
                this.updateBrand.name=this.brand.name;
                this.updateBrand.logo=this.brand.logo;
                putBrands(this.updateBrand).then(response => {
                  this.$refs[formName].resetFields();
                  this.$message({
                    message: '修改成功',
                    type: 'success',
                    duration:1000
                  });
                  this.$router.back();
                });
              } else {
                this.brand.logo="https://img30.360buyimg.com/popshop/jfs/t1/5871/24/8604/4075/5baa0148E93f1a75f/3ea946875c373491.jpg"
                console.log("createBrand",this.brand)
                createBrand(this.brand).then(response => {
                  // this.$refs[formName].resetFields();
                  // this.brand = Object.assign({},defaultBrand);
                  this.$message({
                    message: '提交成功',
                    type: 'success',
                    duration:1000
                  });
                  this.$router.push('/brand')
                });
              }
            });

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
      resetForm(formName) {
        this.$refs[formName].resetFields();
        this.brand = Object.assign({},defaultBrand);
      }
    }
  }
</script>
<style>
</style>


