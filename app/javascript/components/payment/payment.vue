<template>
	<div id="payment-body">
		<div class="py-5">
			<div class="container">
				<div class="row py-3">
					<div class="mx-auto col-lg-6 col-6">
						<h1 class="my-2 text-center">商品支払い</h1>
					</div>
				</div>
				<div class="row">
					<div class="mx-auto col-md-6 p-4">
						<div class="card border-primary">
							<div class="card-header">
								<strong>商品情報</strong>
								<small>記入した情報を確認してください。</small>
							</div>
							<img
								class="card-img-top"
								src="../order/chi1.jpg"
								alt="Card image cap"
							/>
							<div class="card-body">
								<h5 class="card-title">作品情報</h5>
								<p class="card-text">
									フレームサイズ： {{ order.flame_size }}
									<br />プレミアムラッピング有無：{{ order.premium_wrapping
									}}<br />商品情報:<br />
								</p>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<h5 class="card-title">名前</h5>
									{{ order.name_kanji }} {{ order.name_furigana }}
								</li>
								<li class="list-group-item">
									<h5 class="card-title">写真送信方法</h5>
									写真データーはメールORラインI'dで送信
								</li>
								<li class="list-group-item">
									<h5 class="card-title">電話番号</h5>
									{{ order.home_phone_number }} {{ order.cell_phone_number }}
								</li>
								<li class="list-group-item">
									<h5 class="card-title">住所</h5>
									{{ order.postal_code }} {{ order.address1 }}
									{{ order.address2 }}
								</li>
								<li class="list-group-item">
									<h5 class="card-title">コメント</h5>
									{{ order.comment }}
								</li>
							</ul>
						</div>
					</div>
					<patment-option :order="order"> </patment-option>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
import axios from 'axios';
import PaymentOption from './payment_option';

export default {
	components: {
		//決済情報
		'patment-option': PaymentOption,
	},
	data: function() {
		return {
			order: {
				sample_image_id: '',
				order_number: '',
				order_status: '',
				flame_size: '',
				premium_wrapping: '',
				price: '',
				name_kanji: '',
				name_furigana: '',
				email: '',
				line_id: '',
				cell_phone_number: '',
				home_phone_number: '',
				postal_code: '',
				address1: '',
				address2: '',
				comment: '',
				created_at: '',
				updated_at: '',
				checkout: false,
			},
		};
	},
	created: function() {
		//画面の最上に
		scrollTo(0, 0);
		// api.get order data 返す
		this.getOrderInfomation();
	},
	watch: {
		// payment_result: function(val){
		//   alert(val)
		// }
	},
	computed: {},
	mounted: function() {},
	methods: {
		/**
		 * オーダー情報取得
		 */
		getOrderInfomation() {
			const getOrderNumber = this.$route.params['order_number'];

			axios.get('/api/orders/' + getOrderNumber).then(
				response => {
					if (response.status == 200) {
						this.order = response.data.order;
						if (this.order.order_status !== 1) this.$router.push('/not_found');
					} else {
						this.$router.push('/not_found');
					}
				},
				error => {
					this.$router.push('/not_found');
				},
			);
		},

		sethyphe(value) {
			if (value.length > 7) {
				return (
					value.slice(0, -8) + '-' + value.slice(-8, -4) + '-' + value.slice(-4)
				);
			} else {
				return value.slice(0, -4) + '-' + value.slice(-4);
			}
		},
	},
};
</script>
<style lang="sass"></style>
