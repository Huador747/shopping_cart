<style>
    /* ทำให้ภาพสไลด์ responsive */
    .carousel-item img {
        width: 100%; /* ปรับขนาดตามเนื้อหา */
        max-width: 100%; /* ไม่ให้เกินขอบจอ */
        height: 513px; /* ค่าเริ่มต้นสำหรับ Desktop */
        object-fit: cover; /* ปรับภาพให้เต็มโดยไม่เสียอัตราส่วน */
        margin: 0 auto; /* จัดให้อยู่ตรงกลาง */
    }

    /* ปรับขนาดสำหรับ Tablet */
    @media (max-width: 992px) {
        .carousel-item img {
            height: 300px;
        }
    }

    /* ปรับขนาดสำหรับ Mobile */
    @media (max-width: 576px) {
        .carousel-item img {
            height: 200px;
        }
    }
</style>

<div class="col-md-12">
    <div id="bannerCarousel" class="carousel slide" data-ride="carousel" data-interval="2300">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#bannerCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#bannerCarousel" data-slide-to="1"></li>
            <li data-target="#bannerCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Slide Images -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="banner/banner1.jpg" class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="banner/banner2.jpg" class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="banner/banner3.jpg" class="d-block w-100">
            </div>
        </div>
    </div>
</div>
