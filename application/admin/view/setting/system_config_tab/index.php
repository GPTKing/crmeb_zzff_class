{extend name="public/container"}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">
                <div class="layui-btn-group">
                    <button type="button" class="layui-btn layui-btn-normal layui-btn-sm add-config-category"><i class="layui-icon">&#xe608;</i>添加配置分类</button>
                    <button type="button" class="layui-btn layui-btn-normal layui-btn-sm add-config"><i class="layui-icon">&#xe608;</i>添加配置</button>
                </div>
            </div>
        <div class="layui-card-body">
            <div class="ibox-content">
                <div class="row">

                    <div class="m-b m-l">

                        <form action="" class="form-inline">

                            <select name="status" aria-controls="editable" class="form-control input-sm">
                                <option value="">状态</option>
                                <option value="1" {eq name="where.status" value="1"}selected="selected"{/eq}>显示</option>
                                <option value="0" {eq name="where.status" value="0"}selected="selected"{/eq}>不显示</option>
                            </select>

                            <div class="input-group">

                                <input type="text" placeholder="请输入分类昵称" name="title" value="{$where.title}" class="input-sm form-control"> <span class="input-group-btn">

                                    <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe615;</i>搜索</button> </span>

                            </div>

                        </form>

                    </div>



                </div>

                <div class="table-responsive">

                    <table class="table table-striped  table-bordered">

                        <thead>

                        <tr>
                            <th style="width:60px;text-align:center;">编号</th>

                            <th style="text-align:center;">分类昵称</th>

                            <th style="text-align:center;">分类字段</th>

                            <th style="text-align:center;">是否显示</th>

                            <th style="text-align:center;">操作</th>

                        </tr>

                        </thead>

                        <tbody class="">

                        {volist name="list" id="vo"}

                        <tr>

                            <td class="text-center">

                                {$vo.id}

                            </td>

                            <td class="text-center">

                                <a href="{:url('sonconfigtab',array('tab_id'=>$vo['id']))}" style="cursor: pointer">{$vo.title}</a>

                            </td>

                            <td class="text-center">

                                {$vo.eng_title}

                            </td>

                            <td class="text-center">

                                {if condition="$vo.status eq 1"}
                                <i class="fa fa-check text-navy"></i>
                                {elseif condition="$vo.status eq 2"/}
                                <i class="fa fa-close text-danger"></i>
                                {/if}

                            </td>

                            <td class="text-center">

                                <button class="layui-btn layui-btn-normal layui-btn-xs" type="button"  onclick="$eb.createModalFrame('编辑','{:Url('edit',array('id'=>$vo['id']))}')"><i class="layui-icon">&#xe642;</i>编辑</button>

                                {if condition="$vo['id'] gt 2"}
                                <button class="layui-btn layui-btn-danger layui-btn-xs" data-id="{$vo.id}" type="button" data-url="{:Url('delete',array('id'=>$vo['id']))}" ><i class="layui-icon">&#xe640;</i>删除

                                </button>
                                {/if}

                            </td>

                        </tr>

                        {/volist}

                        </tbody>

                    </table>

                </div>

                {include file="public/inner_page"}

            </div>

        </div>

    </div>

</div>
{/block}
{block name="script"}
<script>

    $('.add-config-category').on('click',function (e) {
        $eb.createModalFrame('添加配置分类',"{:Url('create')}");
    })
    $('.layui-btn-danger').on('click',function(){

        var _this = $(this),url =_this.data('url');

        $eb.$swal('delete',function(){

            $eb.axios.get(url).then(function(res){

                if(res.status == 200 && res.data.code == 200) {

                    $eb.$swal('success',res.data.msg);

                    _this.parents('tr').remove();

                }else

                    return Promise.reject(res.data.msg || '删除失败')

            }).catch(function(err){

                $eb.$swal('error',err);

            });

        })

    });
    $('.add-config').on('click',function (e) {
        $eb.swal({
            title: '请选择数据类型',
            input: 'radio',
            inputOptions: ['文本框','多行文本框','单选框','文件上传','多选框'],
            inputValidator: function(result) {
                return new Promise(function(resolve, reject) {
                    if (result) {
                        resolve();
                    } else {
                        reject('请选择数据类型');
                    }
                });
            }
        }).then(function(result) {
            if (result) {
                $eb.createModalFrame(this.innerText,"{:Url('setting.systemConfig/create')}?type="+result);
            }
        })
    })
</script>
{/block}
