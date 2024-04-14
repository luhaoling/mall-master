<template>
  <div class="app-container">
    <el-card class="operate-container" shadow="never">
      <i class="el-icon-tickets" style="margin-top: 5px"></i>
      <span style="margin-top: 5px">数据列表</span>
      <el-button class="btn-add" @click="goAdd()" size="mini">添加</el-button>
    </el-card>
    <div class="table-container">
      <el-table
        ref="productTable"
        :data="list"
        style="width: 100%"
        v-loading="listLoading"
        border
      >
      <el-table-column label="编号" align="center">
        <template slot-scope="scope">
          <p>{{ scope.row.id }}</p>
        </template>
      </el-table-column>

        <el-table-column label="分类" align="center">
          <template slot-scope="scope">{{ scope.row.category.name }}</template>
        </el-table-column>
        <el-table-column label="品牌" align="center">
          <template slot-scope="scope">
            <p>{{ scope.row.brand.name }}</p>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-button size="mini"
            @click="goDetail(scope.$index, scope.row.id,scope.row)"
             >查看
            </el-button>
            <el-button size="mini" @click="deleteBrandToCate(scope.$index, scope.row.id)">
              删除
            </el-button>
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
        :current-page.sync="listQuery.page"
        :total="total"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import { getBrandToCate, deleteBrandToCate } from '@/apis/goods';

export default {
  name: 'brandToCate',
  data() {
    return {
      list: [],
      total: null,
      listLoading: true,
      listQuery: {
        page: 1, // 当前页码
        size: 10 // 每页显示条数
      },
      delete:{
        id:0
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    getList() {
      this.listLoading = true;
      getBrandToCate(this.listQuery).then(response => {
        this.listLoading = false;
        this.list = response.data.list || [];
        this.total = response.data.total;
      });
    },
    deleteBrandToCate(index, id) {
      this.$confirm('是否要确认删除?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.delete.id=id
        deleteBrandToCate(this.delete).then(() => {
          this.$message({
            message: '删除成功！',
            type: 'success'
          });
          this.list.splice(index, 1);
        });
      });
    },
    goAdd() {
      this.$router.push('/editbrandcate');
    },
    goDetail(index,id,obj) {
        this.$router.push({path:'/editbrandcate',query:{id:id}})
        localStorage.setItem('brandToCate',JSON.stringify(obj))
      },
    handleSizeChange(val) {
      this.listQuery.size = val;
      this.getList();
    },
    handleCurrentChange(val) {
      this.listQuery.page = val;
      this.getList();
    }
  }
};
</script>

<style scoped>
.cat-name {
  margin-right: 50px;
}
</style>
