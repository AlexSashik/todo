// Выделение всех checkbox

$("#all_goods").on('click', function () {
	if ($("#all_goods").prop("checked") == true ) {
		$('.goods_checkboxes').prop("checked", true);
	} else {
		$('.goods_checkboxes').prop("checked", false);
	}
});


// Скрытие блока оповещения
$("#info_back").on("click", function () {
	$("#info_text").animate({ opacity: 0}, 200);
	$("#info_back").css("display", "none");
	setTimeout('$("#info_text").css("display", "none");', 200);
});

$("#info_close").on("click", function () {
	$("#info_text").animate({ opacity: 0}, 200);
	$("#info_back").css("display", "none");
	setTimeout('$("#info_text").css("display", "none");', 200);
});

// Обработка отправки формы на удаление товаров
function delAll () {
	if ($('input:checkbox:checked').length == 0) {
		return (true);
	} else {
		return confirm ('Вы точно хотите удалить все выделенные товары?');
	}
}

function del() {
	return confirm ('Вы точно хотите удалить выделенный товар?');
}


 console.log($('input:checkbox:checked').length);        