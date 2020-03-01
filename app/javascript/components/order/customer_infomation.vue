<template>
	<div class="py-4 text-center">
		<div class="container">
			<div class="row">
				<div class="mx-auto col-lg-6 col-10">
					<h1>注文者情報</h1>
					<form class="text-left">
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="name-kanji">名前（漢字）</label>
								<input
									type="text"
									class="form-control"
									id="name-kanji"
									placeholder="山田慶次"
								/>
							</div>
							<div class="form-group col-md-6">
								<label for="name-hurigana">名前（ひらがな）</label>
								<input
									type="text"
									class="form-control"
									id="name-hurigana"
									placeholder="やまだけいじ"
								/>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="email">メール</label>
								<input
									type="text"
									class="form-control"
									id="email"
									placeholder="yamada@gmail.com"
								/>
							</div>
							<div class="form-group col-md-6">
								<label for="line-id" contenteditable="true"
									>ラインID<br
								/></label>
								<input
									type="text"
									class="form-control"
									id="line-id"
									placeholder="yamadaline"
								/>
							</div>
						</div>
						<div class="form-group" style="">
							<label>お届け先（郵便番号）<br /></label
							><input
								type="text"
								class="form-control w-50"
								id="address1"
								placeholder="東京都豊島区池袋"
							/>
						</div>
						<div class="form-group" style="">
							<label>お届け先（都道府県）<br /></label
							><input
								type="text"
								class="form-control"
								id="address2"
								placeholder="Johann W. Goethe"
							/>
						</div>
						<div class="form-group" style="">
							<label>お届け先（市区町村番地ほか）<br /></label
							><input
								type="text"
								class="form-control"
								id="address3"
								placeholder="山田ビル２０１号"
							/>
						</div>
						<div class="form-group"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
export default {};
</script>
<style lang="scss"></style>
