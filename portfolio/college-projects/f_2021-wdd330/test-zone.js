function returningValue() {

	function returningValue2() {
		let value = 2;
		console.log(value);
		return value;
	}

	return 1;
}


let value3 = returningValue().returningValue2();

console.log(value3);

