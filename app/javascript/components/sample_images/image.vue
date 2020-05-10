<template>
	<div id="image-body">
		<div class="row">
			<div
				class="col-md-3 col-6 p-3"
				v-for="image in images"
				v-bind:key="image.id"
			>
				<img
					v-b-modal="'image-modal-' + image.id"
					class="img-fluid d-block"
					src="https://static.pingendo.com/img-placeholder-1.svg"
				/>
				<p>{{ image.name }}</p>
				<image-modal
					v-bind:id="'image-modal-' + image.id"
					v-bind:image="image"
				/>
			</div>
		</div>
	</div>
</template>

<script>
// なぜかbootstrapのmodalclassができない、なのでb-modalでmodalを作成することにした
import ImageModal from '../common/modal/image_modal';

export default {
	props: ['images'],
	components: {
		'image-modal': ImageModal,
	},
	mounted: function() {},
	data: function() {
		return {};
	},
	methods: {},
};
</script>
