let edit = false;

let disabledInputs = (bool) => {
	$("#textarea").prop("disabled", bool);

};

let clearInputs = () => {
	$("#page-title").val("");
	$("#textarea").val("");
	$("#button").text("Save");
};


window.addEventListener("message", (event) => {
	let action = event.data;

	if (action.action === "view") {
		$("#container").fadeIn(500);
		$("#container").css("display", "flex");
	
		$("#page-title").val(action.metadata.title);
		$("#textarea").val(action.metadata.object);
		$("#button").text(action.metadata.save);

		disabledInputs(true);
		edit = false;
	} else if (action.action === "create") {
		$("#container").fadeIn(500);
		$("#container").css("display", "flex");
		$("#page-title").text(action.metadata.title);

		disabledInputs(false);
		edit = true;
	}
});

$(document).on("click", "#button", function () {
	if (edit) {
		$.post(
			`https://${GetParentResourceName()}/giveItem`,
			JSON.stringify({
				title: $("#page-title").val(),
				object: $("#textarea").val(),
			})
		);

		$("#container").fadeOut(500);
		clearInputs();
	}
});


document.onkeyup = function (data) {
	if (data.which == 27) {
		$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));

		$("#container").fadeOut(500);
		clearInputs();
	}
};
