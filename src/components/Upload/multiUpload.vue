<template> 
  <div>
    <el-upload
      :action="useOss?host:minioUploadUrl"
      :data="useOss?dataObj:null"
      list-type="picture-card"
      :file-list="value"
      :before-upload="beforeUpload"
      :on-remove="handleRemove"
      :on-success="handleUploadSuccess"
      :on-preview="handlePreview"
      :limit="maxCount"
      :on-exceed="handleExceed"
      :disabled="disabled"
      ref="load"
      :multiple="multiple"
    >
      <!-- :http-request="requestImg" -->
      <i class="el-icon-plus"></i>
    </el-upload>
    <el-dialog :visible.sync="dialogVisible">
      <img width="100%" :src="dialogImageUrl" alt="">
    </el-dialog>
  </div>
</template>
<script>

  import axios from 'axios'
  import qs from 'qs';

  export default {
    name: 'multiUpload',
    props: {
      //图片属性数组
      value: {
        type: Array,
        default:()=> {
          return []
        }
      },
      multiple: {
        type:Boolean,
        default:true
      },
      //最大上传图片数量
      maxCount:{
        type:Number,
        default:5
      },
      disabled:Boolean
    },
    data() {
      return {
        dataObj: {
          signature: '',
          key: '',
          key: '',
        },
        host:'',
        dir:'',
        dialogVisible: false,
        dialogImageUrl:null,
        useOss:true, //使用oss->true;使用MinIO->false
        ossUploadUrl:'',
        minioUploadUrl:'http://localhost:8080/minio/upload',
      };
    },
    computed: {
      fileList() {

        return this.value||[];
      }
    },
    methods: {
      emitInput(value) {

        this.$emit('input', value)
      },
      handleRemove(file, value) {
        this.emitInput(value);
      },
      handlePreview(file) {
        this.dialogVisible = true;
        this.dialogImageUrl=file.url;
      },
      beforeUpload(file) {
        let _self = this;
          _self.dataObj.name = file.name
        if(!this.useOss){
          //不使用oss不需要获取策略
          return true;
        }
        console.log('文件名',file)
      },
      handleUploadSuccess(res, file,fileList) {
        console.log('图片上传回调', fileList)
        let imgList = []
        fileList.forEach(item=> {
          if(item.size) {
            imgList.push({url:this.host+'/'+this.dir+item.name});
          } else {
            imgList.push(item)
          }
        })
        this.emitInput(imgList);
      },
      handleExceed(files, value) {
        this.$message({
          message: '最多只能上传'+this.maxCount+'张图片',
          type: 'warning',
          duration:1000
        });
      },
    }
  }
</script>
<style>

</style>


