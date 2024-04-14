<template>
  <div class="app-container">
    <el-card class="operate-container" shadow="never">
      <i class="el-icon-tickets"></i>
      <span>数据列表</span>
      <el-button class="btn-add" @click="addBrand()" size="mini">添加</el-button>
    </el-card>
    <div class="table-container">
      <el-table ref="brandTable" :data="list" style="width: 100%" @selection-change="handleSelectionChange" v-loading="listLoading" border>
        <el-table-column label="品牌id" align="center">
          <template slot-scope="scope">{{ scope.row.id }}</template>
        </el-table-column>
        <el-table-column label="品牌名称" align="center">
          <template slot-scope="scope">{{ scope.row.name }}</template>
        </el-table-column>
        <el-table-column label="图片" align="center">
          <template slot-scope="scope">
            <img :src="scope.row.logo" class="imgs" alt="">
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200" align="center">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleUpdate(scope.$index, scope.row)">编辑</el-button>
            <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="pagination-container">
      <el-pagination
        background
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        layout="total, sizes,prev, pager, next,jumper"
        :page-size="listQuery.size"
        :current-page.sync="pageNum" 
        :total="total"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import { getBrands, deleteBrands } from '@/apis/goods'

export default {
  name: 'brandList',
  data() {
    return {
      pageNum: 1, // 使用 pageNum 代替 listQuery.page
      listQuery: {
        page: 1,
        size: 10
      },
      list: [],
      total: null,
      listLoading: true,
      multipleSelection: [],
      deleteId: {
        id: 0
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      this.listQuery.page = this.pageNum; // 同步 pageNum 和 listQuery.page
      getBrands(this.listQuery).then(response => {
        this.listLoading = false
        this.list = response.data.list || []
        this.total = response.data.total
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    handleUpdate(index, row) {
      this.$router.push({ path: '/updateBrand', query: { id: row.id } })
    },
    handleDelete(index, row) {
      this.$confirm('是否要删除该品牌', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.deleteId.id = row.id
        deleteBrands(this.deleteId).then(response => {
          this.$message({
            message: '删除成功',
            type: 'success',
            duration: 1000
          })
          this.getList()
        })
      })
    },
    handleSizeChange(val) {
      this.listQuery.size = val;
      this.getList();
    },
    handleCurrentChange(val) {
      this.pageNum = val; // 更新 pageNum
    },
    addBrand() {
      this.$router.push({ path: '/addBrand' })
    }
  }
}
</script>

<style scoped>
.imgs {
  width: 50px;
  height: 50px;
}
</style>
