{extend name="public/container"}
{block name="content"}
<div class="layui-fluid">
<div class="layui-row">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="row">
                    <div class="m-b m-l">
                        <form action="" class="form-inline">
                            <select name="status" aria-controls="editable" class="form-control input-sm">
                                <option value="">提现状态</option>
                                <option value="-1" {eq name="where.status" value="-1"}selected="selected"{/eq}>未通过</option>
                                <option value="0" {eq name="where.status" value="0"}selected="selected"{/eq}>未提现</option>
                                <option value="1" {eq name="where.status" value="1"}selected="selected"{/eq}>已通过</option>
                            </select>
                            <select name="extract_type"  class="form-control input-sm">
                                <option value="">提现方式</option>
                                <option value="alipay" {eq name="where.extract_type" value="alipay" }selected="selected"{/eq}>支付宝</option>
                                <option value="bank" {eq name="where.extract_type" value="bank"}selected="selected"{/eq}>银行卡</option>
                                <option value="weixin" {eq name="where.extract_type" value="weixin"}selected="selected"{/eq}>微信</option>
                            </select>
                            <div class="input-group">
                                  <span class="input-group-btn">
                                        <input type="text" name="nireid" value="{$where.nireid}" placeholder="微信昵称/姓名/支付宝账号/银行卡号/微信号" class="input-sm form-control" size="38">
                                        <button type="submit" class="layui-btn layui-btn-sm layui-btn-normal" style="margin-left: 5px;"><i class="layui-icon">&#xe615;</i>搜索</button>
                                         <button class="layui-btn layui-btn-sm layui-btn-normal" onclick="window.location.reload()" style="margin-left: 5px;"><i class="layui-icon">&#xe669;</i>刷新</button>
                                     </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped  table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center" style="width:60px;">编号</th>
                            <th class="text-center">用户信息</th>
                            <th class="text-center">提现金额</th>
                            <th class="text-center">提现方式</th>
                            <th class="text-center">添加时间</th>
                            <th class="text-center">备注</th>
                            <th class="text-center">审核状态</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody class="">
                        {volist name="list" id="vo"}
                        <tr>
                            <td class="text-center">
                                {$vo.id}
                            </td>
                            <td class="text-center">
                               昵称：{$vo.nickname}/用户id:{$vo.uid}
                            </td>
                            <td class="text-center" style="color: #00aa00;">
                                {$vo.extract_price}
                            </td>
                            <td class="text-center">
                                {if condition="$vo['extract_type'] eq 'bank'"}
                                姓名：{$vo.real_name}<br>
                                银行卡号：{$vo.bank_code}
                                <br/>
                                开户行地址：{$vo.bank_address}
                                {elseif condition="$vo['extract_type'] eq 'weixin'"/}
                                昵称：{$vo.nickname}<br>
                                微信号：{$vo.wechat}
                                {else/}
                                姓名：{$vo.real_name}<br>
                                支付宝账号：{$vo.alipay_code}
                                {/if}
                            </td>
                            <td class="text-center">
                                {$vo.add_time|date='Y-m-d H:i:s',###}
                            </td>
                            <td class="text-center">
                                {$vo.mark}
                            </td>
                            <td class="text-center">
                                {if condition="$vo['status'] eq 1"}
                                提现通过<br/>
                                {elseif condition="$vo['status'] eq -1"/}
                                提现未通过<br/>
                                未通过原因：{$vo.fail_msg}
                                <br>
                                未通过时间：{$vo.fail_time|date='Y-m-d H:i:s',###}
                                {else/}
                                未提现<br/>
                                <button data-url="{:url('fail',['id'=>$vo['id']])}" class="layui-btn layui-btn-danger layui-btn-xs zsff-fail" type="button"><i class="layui-icon">&#x1006;</i>退回</button>
                                <button data-url="{:url('succ',['id'=>$vo['id']])}" class="layui-btn layui-btn-normal layui-btn-xs zsff-success" type="button"><i class="layui-icon">&#xe605;</i>通过</button>
                                {/if}
                            </td>
                            <td class="text-center">
                                <button class="layui-btn layui-btn-normal layui-btn-xs" type="button"  onclick="$eb.createModalFrame('编辑','{:Url('edit',array('id'=>$vo['id']))}')"><i class="layui-icon">&#xe642;</i>编辑</button>
<!--                                <button class="layui-btn layui-btn-danger delete-btn-danger layui-btn-xs" data-url="{:Url('delete',array('id'=>$vo['id']))}" type="button"><i class="layui-icon">&#xe640;</i> 删除</button>-->
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
</div>
{/block}
{block name="script"}
<script>
    (function(){
        $('.zsff-fail').on('click',function(){
            var url = $(this).data('url');
            $eb.$alert('textarea',{
                title:'请输入未通过愿意',
                value:'输入信息不完整或有误!',
            },function(value){
                $eb.axios.post(url,{message:value}).then(function(res){
                    if(res.data.code == 200) {
                        window.location.reload();
                        $eb.$swal('success', res.data.msg);
                    }else
                        $eb.$swal('error',res.data.msg||'操作失败!');
                });
            });
        });
        $('.zsff-success').on('click',function(){
            var url = $(this).data('url');
            $eb.$swal('delete',function(){
                $eb.axios.post(url).then(function(res){
                    if(res.data.code == 200) {
                        window.location.reload();
                        $eb.$swal('success', res.data.msg);
                    }else
                        $eb.$swal('error',res.data.msg||'操作失败!');
                });
            },{
                title:'确定审核通过?',
                text:'通过后无法撤销，请谨慎操作！',
                confirm:'审核通过'
            });
        });
        $('.delete-btn-danger').on('click',function(){
            window.t = $(this);
            var _this = $(this),url =_this.data('url');
            $eb.$swal('delete',function(){
                $eb.axios.get(url).then(function(res){
                    if(res.status == 200 && res.data.code == 200) {
                        $eb.$swal('success',res.data.msg);
                        window.location.reload();
                        _this.parents('tr').remove();
                    }else
                        return Promise.reject(res.data.msg || '删除失败')
                }).catch(function(err){
                    $eb.$swal('error',err);
                });
            })
        });
        $(".open_image").on('click',function (e) {
            var image = $(this).data('image');
            $eb.openImage(image);
        })
    }());
</script>
{/block}

