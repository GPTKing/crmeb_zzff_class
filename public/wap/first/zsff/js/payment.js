(function (global, factory) {
    typeof define == 'function' && define(['store', 'helper', 'vue'], factory);
})(this, function (app, $h, Vue) {
    var u = navigator.userAgent;
    var phone_ios = false;
    if (u.indexOf('iPhone') > -1) {//苹果手机
        phone_ios = false;
    }
    Vue.component('payment', {
        props: {
            payment: {
                type: Boolean,
                default: false
            },
            money: {
                type: String,
                default: '0.00'
            },
            now_money: {
                type: String,
                default: '0.00'
            },
            special_id: {
                type: Number,
                default: 0,
            },
            pay_type_num: {
                type: Number,
                default: -1,
            },
            pinkId: {
                type: Number,
                default: 0,
            },
            link_pay_uid: {
                type: Number,
                default: 0
            },
            iswechat: {
                type: Boolean,
                default: false
            },
            isyue: {
                type: Boolean,
                default: false
            },
            isalipay: {
                type: Boolean,
                default: false
            },
            signs: {
                type: Array,
                default: []
            }
        },
        template: `<div>
        <div class="payment" :class="payment ? '' : 'up'">
            <div class="title"><span class="iconfont iconguanbi2" @click="close"></span>支付方式</div>
            <div class="total acea-row row-between-wrapper">
                <div>支付总额</div>
                <div class="money">¥ {{money}}</div>
            </div>
            <div class="select-btn" style="height: auto;">
                <div v-if="!phoneIos && iswechat" class="checkbox-wrapper">
                    <label class="well-check">
                        <input v-model="payType" type="radio" name="payment" value="weixin">
                        <i class="icon"></i>
                        <span class="iconfont iconweixin2"></span>
                        <span class="sex">微信支付</span>
                    </label>
                </div>
                <div v-if="isalipay" class="checkbox-wrapper">
                    <label class="well-check">
                        <input v-model="payType" type="radio" name="payment" value="zhifubao">
                        <i class="icon"></i>
                        <span class="iconfont iconicon34" style="color: #00A0E9"></span>
                        <span class="sex">支付宝</span>
                    </label>
                </div>
                <div v-if="isyue" class="checkbox-wrapper">
                    <label class="well-check">
                        <input v-model="payType" type="radio" name="payment" value="yue">
                        <i class="icon"></i>
                        <span class="iconfont iconicon-test" style="color: #FC992C"></span>
                        <span class="sex">余额<b style="color: #aaa;font-size: 14px;">(可用余额:{{now_money}})</b></span>
                    </label>
                </div>
            </div>
            <div class="payBnt" @click="goPay">确认支付</div>
        </div>
        <div class="mask" :hidden="payment" @touchmove.prevent></div>
    </div>`,
        data: function () {
            return {
                payType: phone_ios ? (this.isalipay ?'zhifubao' : 'yue') : (this.iswechat ? 'weixin': (this.isalipay ?'zhifubao' : 'yue')),
                phoneIos: phone_ios,
            }
        },
        mounted: function () {
            console.log(this.isyue);
        },
        methods: {
            close: function () {
                this.$emit("change", { action: 'payClose', value: true })//$emit():注册事件；
            },
            goPay: function () {
                var that = this;
                if(!that.isalipay && !that.iswechat && !that.isyue){
                    that.$emit("change",{action:'payClose',value:true});
                    return $h.showMsg('支付未开启');
                }
                $h.loadFFF();
                app.basePost($h.U({
                    c: 'special',
                    a: 'create_order',
                }), {
                    special_id: that.special_id,
                    pay_type_num: that.pay_type_num,
                    payType: that.payType,
                    pinkId: that.pinkId,
                    link_pay_uid: that.link_pay_uid,
                    sign: that.signs
                }, function (res) {
                    $h.loadClear();
                    res.data.data.msg=res.data.msg;
                    that.$emit('change',{action:'pay_order',value:res.data.data});
                },function () {
                    that.$emit("change",{action:'payClose',value:true});
                    $h.loadClear();
                });
            }
        }
    });
})
