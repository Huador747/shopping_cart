<?php
include('h.php');
include("condb.php");
$p_id = $_GET["id"];
?>
<!DOCTYPE html>

<head>
    <?php include('boot4.php'); ?>
    <style>
        @media only screen and (max-width: 1980px) {
            .modal-content {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <?php
    include('banner.php');
    include('navbar.php');
    ?>
    <div class="container">
        <div class="row">
            <?php
            $sql = "SELECT * FROM tbl_product as p 
          INNER JOIN tbl_type  as t ON p.type_id=t.type_id      
      AND p_id = $p_id
      ";
            $result = mysqli_query($con, $sql) or die("Error in query: $sql " . mysqli_error());
            $row = mysqli_fetch_array($result);

            $sql_last_view = "SELECT p_view FROM tbl_product Where p_id = '" . $p_id . "'";
            $resalt_last_view = mysqli_query($con, $sql_last_view) or die("Error in query: $sql_last_view " . mysqli_error());
            $row_last_view = mysqli_fetch_assoc($resalt_last_view);
            //เรียกดูวิวของสินค้านั้นๆ
            $last_view = $row_last_view['p_view']++;
            $last_view++;
            //นำวิวสินค้าเดิมมา+1
            $update_view = "UPDATE `tbl_product` SET `p_view` = '" . $last_view . "' WHERE `p_id` ='" . $p_id . "'";
            $resalt_updateview = $con->query($update_view);
            //อัพเดทวิวสินค้าใหม่
            
            ?>
            <div class="col-md-12">
                <div class="container" style="margin-top: 25px" ;>
                    <div class="row">
                        <div class="col-md-4">
                            <?php
                            $img_path = 'p_img/' . $row['p_img'];
                            if (file_exists($img_path)) {
                                echo "<img src='$img_path' width='100%' id='myImg'>";
                            } else {
                                echo "Image not found.";
                            }
                            ?>
                            <div id="myModal" class="modal">
                                <span class="close">&times;</span>
                                <img class="modal-content" id="img01">
                                <div id="caption"></div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <br>
                            <h5><b><?php echo $row["p_name"]; ?></b></h5>
                            <p>
                                ประเภท : <?php echo $row["type_name"]; ?>
                                <br>
                                ราคา : <span style="color: red;"><?php echo number_format($row["p_price"], 2); ?></span>
                                บาท 
                                <br>
                                <b>สเปคสินค้า</b>
                                <br>
                                <?php echo nl2br($row["p_spec"]); ?>
                                <br>
                                <b>คงเหลือ :</b> <?php echo $row["p_qty"]; ?> <?php echo $row["p_unit"]; ?>
                                <br>
                                <b>รายละเอียดสินค้า</b>
                                <br>
                                <?php echo nl2br($row["p_detail"]); ?>
                                <br><br>จำนวนการเข้าชม <?php echo $row['p_view']; ?> ครั้ง
                            </p>
                            <p> <!-- Go to www.addthis.com/dashboard to customize your tools -->
                                <script type="text/javascript"
                                    src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5500ee80057fdb99"></script>
                            <div class="addthis_inline_share_toolbox_sf2w"></div>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the image and insert it inside the modal - use its "alt" text as a caption
        var img = document.getElementById('myImg');
        var modalImg = document.getElementById("img01");
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        }

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }
    </script>
</body>

</html>
<?php include('script4.php'); ?>