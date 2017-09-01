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

// Обработка удаления пользвателя

function del() {
	return confirm ('Вы точно хотите удалить выделенного пользователя?');
}