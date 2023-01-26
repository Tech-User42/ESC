$(function(){
	window.onload = (e) => {
        /* 'links' the js with the Nui message from main.lua */
		window.addEventListener('message', (event) => {
			gyro = document.getElementById('gyro');
			hp = document.getElementById('hp');
			container = document.getElementById('container');
			var item = event.data;
			if (item !== undefined && item.type === "ui") {
                /* if the display is true, it will show */
				if (item.display == true) {
                    container.classList.add('show');
                     /* if the display is false, it will hide */
				} else if (item.display == false){
                    container.classList.remove('show');
                
                }
			}
			if (item !== undefined && item.type === "gyro") {
                /* if the display is true, it will show */
				if (item.value == 1) {
                    gyro.src= "img/gyro2.png";
                     /* if the display is false, it will hide */
				} 
				else if(item.value == 2){
					gyro.src= "img/gyro1.png";
				}

			}
			if (item !== undefined && item.type === "siren") {
                /* if the display is true, it will show */
				if (item.value == 1) {
                    hp.src= "img/sirene2.png";
                     /* if the display is false, it will hide */
				} 
				else if(item.value == 2){
					hp.src= "img/sirene.png";
				}

			}
		});
	};
});
