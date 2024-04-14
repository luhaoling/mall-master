User
<template> 
    <div class="brand-cate">
        <el-form :model="productCateInfo"
             ref="productCateFrom"
             label-width="150px">
        
            <el-form-item label="分类：" prop="name">
                <el-cascader
                    v-model="productCateInfo.category_id"
                    :options="productCateOptions"
                    :props="props">
                </el-cascader>
        </el-form-item>

            <el-form-item label="品牌：">
                <el-select v-model="productCateInfo.brand_id"
                        placeholder="请选择品牌" >
                <el-option
                    v-for="item in brandOptions"
                    :key="item.id"
                    :label="item.name"
                    :value="item.id">
                </el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit('productCateFrom')">提交</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
import { getBrands, getCategorys, getBrandToCateDetail, createBrandToCate, putBrandToCate } from '@/apis/goods'
export default {
    name: 'editBrandToCate',
    data() {
        return {
            productCateInfo: {},
            props: {
                children: 'subCategory',
                label: 'name',
                value: 'parent'
            },
            productCateOptions: [],
            brandOptions: [],
            update: {
                id: 0,
                category: 0,
                brand: 0
            },
            create: {
                categoryId: 0,
                brandId: 0
            },
        }
    },
    created() {
        this.getBrandList();
        this.getProductCateList();
    },
    methods: {
        getBrandList() {
            getBrands().then(response => {
                this.brandOptions = response.data.list;
            }).catch(error => {
                console.error('Failed to fetch brands:', error);
            });
        },
        getProductCateList() {
            getCategorys().then(response => {
                this.productCateOptions = response.data.list;
                this.processProductCateOptions();
            }).catch(error => {
                console.error('Failed to fetch product categories:', error);
            });
        },
        processProductCateOptions() {
            // 在这里执行对 productCateOptions 的进一步处理或者其他操作
            // 例如，您可以在这里初始化 productCateInfo.category_id 或者执行其他相关逻辑
            // 确保在数据完全获取后再执行这些操作
            let _this = this;
            if (_this.productCateInfo.category_id) {
                _this.productCateOptions.forEach(res => {
                    if (res.subCategory && res.subCategory.length > 0) {
                        res.subCategory.forEach(item => {
                            if (item.subCategory && item.subCategory.length > 0) {
                                item.subCategory.forEach(sub => {
                                    if (sub.parent == _this.productCateInfo.category_id) {
                                        _this.productCateInfo.category_id = [res.parent, item.parent, sub.parent];
                                    }
                                })
                            }
                        })
                    }
                });
            }
        },
        onSubmit() {
            console.log(this.productCateInfo);
            if (typeof this.productCateInfo.category_id === 'number') {
                this.productCateInfo.category_id = [this.productCateInfo.category_id];
            }
            this.productCateInfo.category_id = this.productCateInfo.category_id[2];
            if (this.$route.query.id) {
                this.update.id = this.$route.query.id;
                this.update.category = this.productCateInfo.category_id;
                this.update.brand = this.productCateInfo.brand_id;
                putBrandToCate(this.update).then(res => {
                    this.$message({
                        type: 'success',
                        message: '修改成功!'
                    });
                    this.$router.push('/brandcate');
                }).catch(err => {
                    console.error(err);
                    this.$message({
                        type: 'error',
                        message: err.msg
                    });
                });
            } else {
                this.create.categoryId = this.productCateInfo.category_id;
                this.create.brandId = this.productCateInfo.brand_id;
                createBrandToCate(this.create).then(res => {
                    this.$message({
                        type: 'success',
                        message: '新增成功!'
                    });
                    this.$router.push('/brandcate');
                }).catch(err => {
                    console.error(err);
                    this.$message({
                        type: 'error',
                        message: err.smg
                    });
                });
            }
        }
    }
}
</script>
<style>
.brand-cate{
    margin-top: 30px
}
</style>