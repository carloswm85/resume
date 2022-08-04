const player1 = 'X';
const player2 = 'O';
let player = player1;
const squares = [];

for (let index = 1; index < 10; index++) {
	squares[0] = document.getElementById(`item${index}`);
	squares[0].addEventListener('click', xoChange, true);	
}


let turn = 1;
let content = null;
function xoChange(et) {
	console.log(`touched ${this.id} ${turn++}`);
	et.target.innerHTML = player;
	if (player === player1) player = player2
	else player = player1;

}

