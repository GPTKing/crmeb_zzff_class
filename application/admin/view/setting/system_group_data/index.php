{extend name="public/container"}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <form action="" class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="status">
                                        <option value="">是否可用</option>
                                        <option value="1" {eq name="where.status" value="1"}selected="selected"{/eq}>显示</option>
                                        <option value="2" {eq name="where.status" value="2"}selected="selected"{/eq}>不显示</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <button type="submit" class="layui-btn layui-btn-sm layui-btn-normal"><i class="layui-icon">&#xe615;</i>搜索</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-btn-group">
                        <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" onclick="$eb.createModalFrame('添加数据','{:Url('create',array('gid'=>$gid))}')"><i class="layui-icon">&#xe608;</i>添加数据</button>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th style="width:60px;text-align:center;">编号</th>
                            {volist name="fields" id="vo"}
                                <th style="text-align:center;">{$vo.name}</th>
                            {/volist}
                            <th style="text-align:center;">是否可用</th>
                            <th style="text-align:center;">操作</th>
                        </tr>
                        </thead>
                        <tbody class="">
                        {volist name="list" id="vo"}
                        <tr>
                            <td class="text-center">
                                {$vo.id}
                            </td>
                            {volist name="fields" id="item"}
                                <td class="text-center">
                                    {if condition="isset($vo['value'][$item['title']]['value']) && $vo['value'][$item['title']]['value'] !== ''"}
                                    {if condition="$vo.value[$item['title']]['type'] == 'upload' || $vo.value[$item['title']]['type'] == 'uploads'"}
                                    {if condition="is_array($vo.value[$item['title']]['value'])"}
                                    {volist name="vo.value[$item['title']]['value']" id="valueItem"}
                                    <img class="image" data-image="{$valueItem}" height="50" src="{$valueItem}" />
                                    {/volist}
                                    {else/}
                                    <img class="image" data-image="{$vo.value[$item['title']]['value']}" height="50" src="{$vo.value[$item['title']]['value']}" />
                                    {/if}
                                    {else/}
                                    {$vo.value[$item['title']]['value']}
                                    {/if}
                                    {/if}
                                </td>
                            {/volist}
                            <td class="text-center">
                                {if condition="$vo.status eq 1"}
                                <i class="fa fa-check text-navy"></i>
                                {elseif condition="$vo.status eq 2"/}
                                <i class="fa fa-close text-danger"></i>
                                {/if}
                            </td>
                            <td class="text-center">
                                <button class="layui-btn layui-btn-normal layui-btn-xs" type="button"  onclick="$eb.createModalFrame('编辑','{:Url('edit',array('gid'=>$gid,'id'=>$vo['id']))}')"><i class="layui-icon">&#xe642;</i>编辑</button>
                                <button class="layui-btn layui-btn-danger layui-btn-xs" type="button" data-url="{:Url('delete',array('id'=>$vo['id']))}" type="button"><i class="layui-icon">&#xe640;</i>删除</button>
                            </td>
                        </tr>
                        {/volist}
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-8 m-b-xs">
                        <?php /*  <form action="" class="form-inline">
                              <i class="fa fa-search" style="margin-right: 10px;"></i>
                              <select name="is_show" aria-controls="editable" class="form-control input-sm">
                                  <option value="">是否显示</option>
                                  <option value="1" {eq name="params.is_show" value="1"}selected="selected"{/eq}>显示</option>
                                  <option value="0" {eq name="params.is_show" value="0"}selected="selected"{/eq}>不显示</option>
                              </select>
                              <select name="access" aria-controls="editable" class="form-control input-sm">
                                  <option value="">子管理员是否可用</option>
                                  <option value="1" {eq name="params.access" value="1"}selected="selected"{/eq}>可用</option>
                                  <option value="0" {eq name="params.access" value="0"}selected="selected"{/eq}>不可用</option>
                              </select>
                          <div class="input-group">
                              <input type="text" name="keyword" value="{$params.keyword}" placeholder="请输入关键词" class="input-sm form-control"> <span class="input-group-btn">
                                      <button type="submit" class="btn btn-sm btn-primary"> 搜索</button> </span>
                          </div>
                          </form>  */ ?>

                    </div>
                </div>

                {include file="public/inner_page"}
            </div>
        </div>
    </div>
</div>
{/block}
{block name="script"}
<script>
    layui.form.render();
    $('.layui-btn-danger').on('click',function(){
        window.t = $(this);
        var _this = $(this),url =_this.data('url');
        $eb.$swal('delete',function(){
            $eb.axios.get(url).then(function(res){
                console.log(res);
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
    $(".image").on('click',function (e) {
        var images = $(this).data('image');
        $eb.openImage(images);
    })
</script>
{/block}
