function show(i) {
	var index = document.getElementById("index").value;
	for (j = 0; j < index; j++) {
		if (j == i) {
			document.getElementById(j).style.display = "block";
		} else {
			document.getElementById(j).style.display = "none";
		}
	}
}