<!-- 商品分类列表（包含增删） -->
<template>
  <div class="app-container">
    <el-card class="operate-container" shadow="never">
      <i class="el-icon-tickets" style="margin-top: 5px"></i>
      <span style="margin-top: 5px">数据列表</span>
      <el-button
        class="btn-add"
        @click="handleAddProductCate()"
        size="mini">
        添加
      </el-button>
    </el-card>
    <div class="table-container">
       <el-tree
      :data="list"
      node-key="id"
      :props="{
        children:'subCategory',
        label:'name'
      }"
      :expand-on-click-node="false">
      <div class="custom-tree-node" slot-scope="{ node, data }">
        <!-- {{JSON.stringify(node)}} -->
        <span class="cat-name">{{ node.label }}</span>
        <span>
          <el-button
            type="text"
            size="mini"
            @click="handleUpdate(data)">
            编辑
          </el-button>
          <el-button
            type="text"
            size="mini"
            @click="handleDelete(data)">
            删除
          </el-button>
        </span>
      </div>
    </el-tree>
     
    </div>
   
  </div>
</template>

<script>
  import {fetchList,deleteProductCate,updateShowStatus,updateNavStatus} from '@/api/productCate'
  import {getCategorys,deleteCategorys,putCategorys} from '@/apis/goods'

  export default {
    name: "productCateList",
    data() {
      return {
        list: null,
        total: null,
        listLoading: true,
        listQuery: {
          pageNum: 1,
          pageSize: 5
        },
        parentId: 0,
        delete:{
          id:0
        }
      }
    },
    created() {
      // this.resetParentId();
      this.getList();
    },
    watch: {
      $route(route) {
        // this.resetParentId();
        this.getList();
      }
    },
    methods: {
      resetParentId(){
        this.listQuery.pageNum = 1;
        if (this.$route.query.parentId != null) {
          this.parentId = this.$route.query.parentId;
        } else {
          this.parentId = 0;
        }
      },
      handleAddProductCate() {
        this.$router.push('/addProductCate');
      },
      getList() {
        this.listLoading = true;
        getCategorys().then(response => {
          console.log(response)
          this.listLoading = false;
          this.list = response.data.list;
          console.log(this.list)
          // this.total = response;
        });
      },
      // `${data.data.name+data.data.is_tab?'显示':'不显示'}在导航栏？`
      handleChange(data,id) {
        console.log("changge1Data",data)
        console.log("changge1Data",id)
         this.$confirm(`修改在导航栏设置？`, '修改', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let params = {
            id:id,
            tab:data
          }

          console.log("changgeParams",params)
          putCategorys(params).then(response => {
            this.$message({
              message: '修改成功',
              type: 'success',
              duration: 1000
            });
            // let targetIndex= -1
            
            // this.getList()
          }).catch(err=> {
            data.data.tab=false
          });
        }).catch(err=> {
          data.data.tab=fasle
        });
      },
      handleSizeChange(val) {
        this.listQuery.pageNum = 1;
        this.listQuery.pageSize = val;
        this.getList();
      },
      handleCurrentChange(val) {
        this.listQuery.pageNum = val;
        this.getList();
      },
      handleNavStatusChange(index, row) {
        let data = new URLSearchParams();
        let ids=[];
        ids.push(row.id)
        data.append('ids',ids);
        data.append('navStatus',row.navStatus);
        updateNavStatus(data).then(response=>{
          this.$message({
            message: '修改成功',
            type: 'success',
            duration: 1000
          });
        });
      },
      handleShowStatusChange(index, row) {
        let data = new URLSearchParams();
        let ids=[];
        ids.push(row.id)
        data.append('ids',ids);
        data.append('showStatus',row.showStatus);
        updateShowStatus(data).then(response=>{
          this.$message({
            message: '修改成功',
            type: 'success',
            duration: 1000
          });
        });
      },
      handleShowNextLevel(index, row) {
        this.$router.push({path: '/productCate', query: {parentId: row.id}})
      },
      handleTransferProduct(index, row) {
        console.log('handleAddProductCate');
      },

      handleUpdate(row) {
        // this.$router.push({path:'/updateProductCate',query:{id:row.id}});
        this.$prompt('请输入新名称', '修改'+row.name, {
          confirmButtonText: '确定',
          cancelButtonText: '取消'
        }).then(({ value }) => {
          let params = {
            id: row.parent,
            name:value,
            isTab:row.isTab,
            level:row.level
          }
          putCategorys(params).then(response => {
            this.$message({
              message: '修改成功',
              type: 'success',
              duration: 1000
            });  
            this.getList()
          }
          ).catch(err=> {
            this.$message({
              type: 'error',
              message: err
            });       
          });
        }).catch(() => {
        });
      },
      handleDelete( row) {
        this.$confirm('是否要删除该品牌', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.delete.id=row.parent
          deleteCategorys(this.delete).then(response => {
            this.$message({
              message: '删除成功',
              type: 'success',
              duration: 1000
            });
            let targetIndex= -1
            // this.list.forEach((item,index)=> {
            //   if(item.id==row.id) {

            //   }
            // })
            this.getList()
          });
        });
      }
    },
    filters: {
      levelFilter(value) {
        if (value === 0) {
          return '一级';
        } else if (value === 1) {
          return '二级';
        }
      },
      disableNextLevel(value) {
        if (value === 0) {
          return false;
        } else {
          return true;
        }
      }
    }
  }
</script>

<style scoped>
.cat-name{
  margin-right: 50px;
}
</style>
