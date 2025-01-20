document.addEventListener("DOMContentLoaded", () => {
	const searchInput = document.getElementById("searchInput");
	const filterDropdown = document.getElementById("filterDropdown");
	const tableBody = document.getElementById("tableBody");

	// Function to filter rows based on search input and dropdown value
	function filterTable() {
		const searchValue = searchInput.value.toLowerCase();
		const filterValue = filterDropdown.value;
		const rows = tableBody.getElementsByTagName("tr");

		for (let i = 0; i < rows.length; i++) {
			const cells = rows[i].getElementsByTagName("td");
			const equipmentID = cells[1].textContent.toLowerCase();
			const equipmentName = cells[2].textContent;

			const matchesSearch = equipmentID.indexOf(searchValue) > -1;
			const matchesFilter = filterValue === "all" || equipmentName === filterValue;

			rows[i].style.display = matchesSearch && matchesFilter ? "" : "none";
		}
	}

	// Event listeners for search input and dropdown
	searchInput.addEventListener("keyup", filterTable);
	filterDropdown.addEventListener("change", filterTable);
});