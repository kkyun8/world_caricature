<template>
	<div id="news-body">
		<div class="py-5">
			<div class="container py-2">
				<div class="row text-center">
					<div class="mx-auto col-lg-6">
						<h1>
							お知らせ
							<br />
						</h1>
						<p class="mb-4">お知らせページです。</p>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">Title</th>
								<th scope="col">Date</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="news in displayedPosts" v-bind:key="news.id">
								<td>{{ news.id }}</td>
								<td>{{ news.title }}</td>
								<td>{{ news.updated_at }}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="container">
				<div class="mx-auto col-lg-12">
					<ul class="pagination">
						<li class="page-item">
							<button
								type="button"
								class="page-link"
								v-bind:disabled="page == 1"
								@click="page--"
							>
								Previous
							</button>
						</li>
						<li
							class="page-item"
							v-for="pageNumber in pages"
							v-bind:key="pageNumber.index"
						>
							<a class="page-link" @click="page = pageNumber">
								{{ pageNumber }}
							</a>
						</li>
						<li class="page-item">
							<button
								type="button"
								class="page-link"
								@click="page++"
								v-if="page < pages.length"
							>
								Next
							</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
import axios from 'axios';

export default {
	data: function() {
		return {
			currentPage: 1,
			totalRows: 10,
			perPage: 10,
			newsItems: [],
			page: 1,
			posts: [],
			pages: [],
		};
	},
	methods: {
		getPosts() {
			axios.get('/api/news/').then(response => {
				response.data.news.forEach(element => {
					const updateDate = new Date(element.updated_at);
					const y = updateDate.getFullYear();
					const m = ('00' + (updateDate.getMonth() + 1)).slice(-2);
					const d = ('00' + updateDate.getDate()).slice(-2);
					const updated_at = y + '/' + m + '/' + d;
					const news = {
						id: element.id,
						title: element.title,
						updated_at: updated_at,
					};
					this.posts.push(news);
				});
			});
		},
		setPages() {
			let numberOfPages = Math.ceil(this.posts.length / this.perPage);
			for (let index = 1; index <= numberOfPages; index++) {
				this.pages.push(index);
			}
		},
		paginate(posts) {
			let page = this.page;
			let perPage = this.perPage;
			let from = page * perPage - perPage;
			let to = page * perPage;
			return posts.slice(from, to);
		},
	},
	computed: {
		displayedPosts() {
			return this.paginate(this.posts);
		},
	},
	watch: {
		posts() {
			this.setPages();
		},
	},
	created() {
		this.getPosts();
	},
	filters: {
		trimWords(value) {
			return (
				value
					.split(' ')
					.splice(0, 20)
					.join(' ') + '...'
			);
		},
	},
};
</script>
<style lang="scss"></style>
