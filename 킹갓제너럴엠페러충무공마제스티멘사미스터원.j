
function counter(input){ // 적의 저번 덱을 넣으면 됨

	if( input == '!') return '3'
	if( input == '1') return '2'
	if( input == '2') return '5'
	if( input == '3') return '4'
	if( input == '4') return '!'
	if( input == '5') return '1'	

}

function c_counter(input){ // 나의 저번 덱을 넣으면 됨


	if( input == '!') return '4'
	if( input == '1') return '5'
	if( input == '2') return '1'
	if( input == '3') return '!'
	if( input == '4') return '3'
	if( input == '5') return '2'	


}

function greedy(hands, history){


	if(hands.length == 3){
		console.log( "greedy 3");

		var a = 0.2; // 동률 없도록 초기값 더해줌
		var b = 0.1;
		var c = 0;

		if( history[0][1] == '!')
			var temp1 = '0';
		else
			var temp1 = history[0][1];

		if( history[1][1] == '!')
			var temp2 = '0';
		else
			var temp2 = history[1][1];

		if( history[2][1] == '!')
			var temp3 = '0';
		else
			var temp3 = history[2][1];

		var your = new Array();

		for ( var i = 0 ; i < 6 ; i++){
			if( (temp1 != i)&&(temp2 != i)&&(temp3 != i) )
				
				if(i ==0) your[0] = '!'
				else your[0] = i;
				break;
		}

		for ( var i = 0 ; i < 6 ; i++){
			if( (temp1 != i)&&(temp2 != i)&&(temp3 != i)&&(your[0] != i) )
				your[1] = i;
				break;
		}

		for ( var i = 0 ; i < 6 ; i++){
			if( (temp1 != i)&&(temp2 != i)&&(temp3 != i)&&(your[0] != i)&&(your[1] != i) )
				your[2] = i;
				break;
		}

		
		for (var j = 0; j < 3; j ++){
			for(var i = 0; i < 3; i ++){
				
				if(hands[j] == '1'){
					if(( your[i] == '5') || ( your[i] == '!')){
						
						if(j == 0){
							a += 3;
						}else if(j == 1){
							b += 3;
						}else{
							c += 3;
						}

					}
					else if( your[i] == '1'){
						
						if(j == 0){
							a += 1;
						}else if(j == 1){
							b += 1;
						}else{
							c += 1;
						}

					}

				}
				else if(hands[j] == '!'){
					if(( your[i] == '2') || ( your[i] == '4')){
						
						if(j == 0){
							a += 3;
						}else if(j == 1){
							b += 3;
						}else{
							c += 3;
						}

					}
					else if( your[i] == '!'){
						
						if(j == 0){
							a += 1;
						}else if(j == 1){
							b += 1;
						}else{
							c += 1;
						}

					}
				}
				else{
					if( hands[j] == your[i]){

						if(j == 0){
							a += 1;
						}else if(j == 1){
							b += 1;
						}else{
							c += 1;
						}

					}
					else if( hands[j] > your[i]){

						if(j == 0){
							a += 3;
						}else if(j == 1){
							b += 3;
						}else{
							c += 3;
						}

					}

				}
			}
		}

		if( ( a > b ) && ( a > c ) ){
			return hands[0];
		}
		else if( ( b > a ) && ( b > c ) ){
			return hands[1];
		}
		else{
			return hands[2];
		}



	}
	else if(hands.length == 2){
		console.log( "greedy 2");

		var a = 0.1; // 동률 없도록 초기값 더해줌
		var b = 0;

		if( history[0][1] == '!')
			var temp1 = '0';
		else
			var temp1 = history[0][1];

		if( history[1][1] == '!')
			var temp2 = '0';
		else
			var temp2 = history[1][1];

		if( history[2][1] == '!')
			var temp3 = '0';
		else
			var temp3 = history[2][1];

		if( history[3][1] == '!')
			var temp4 = '0';
		else
			var temp4 = history[3][1];

		var your = new Array();
		
		for ( var i = 0 ; i < 6 ; i++){
			if( (temp1 != i)&&(temp2 != i)&&(temp3 != i)&&(temp4 != i) )
				
				if(i ==0) your[0] = '!'
				else your[0] = i;
				break;
		}

		for ( var i = 0 ; i < 6 ; i++){
			if( (temp1 != i)&&(temp2 != i)&&(temp3 != i)&&(temp3 != i)&&(your[0] != i) )
				your[1] = i;
				break;
		}


		
		for (var j = 0; j < 2; j ++){
			for(var i = 0; i < 2; i ++){
				
				if(hands[j] == '1'){
					if(( your[i] == '5') || ( your[i] == '!')){
						
						if(j == 0){
							a += 3;
						}else if(j == 1){
							b += 3;
						}

					}
					else if( your[i] == '1'){
						
						if(j == 0){
							a += 1;
						}else if(j == 1){
							b += 1;
						}

					}

				}
				else if(hands[j] == '!'){
					if(( your[i] == '2') || ( your[i] == '4')){
						
						if(j == 0){
							a += 3;
						}else if(j == 1){
							b += 3;
						}

					}
					else if( your[i] == '!'){
						
						if(j == 0){
							a += 1;
						}else if(j == 1){
							b += 1;
						}

					}
				}
				else{
					if( hands[j] == your[i]){

						if(j == 0){
							a += 1;
						}else if(j == 1){
							b += 1;
						}

					}
					else if( hands[j] > your[i]){

						if(j == 0){
							a += 3;
						}else if(j == 1){
							b += 3;
						}

					}

				}
			}
		}

		if( a > b ){
			return hands[0];
		}
		else{
			return hands[1];
		}



	}
	else{
		console.log( "greedy 1");
		return hands[0];
	}

}

function think(hands, history, old_games) {


	if(old_games.length == 0){ // 첫번째 판


		if (history.length == 0)
			return '5';
		if (history.length == 1)
			return '4';
		if (history.length == 2)
			return '!';
		if (history.length == 3)
			return '3';
		if (history.length == 4)
			return '1';
		if (history.length == 5)
			return '2';


	}else if(old_games.length == 1){ // 두번째 판


		if (history.length == 0)
			return '2';
		if (history.length == 1)
			return '1';
		if (history.length == 2)
			return '4';
		if (history.length == 3)
			return '5';
		if (history.length == 4)
			return '3';
		if (history.length == 5)
			return '!';


	}
	else{ // 세번째 판 이후


		if (( old_games[0][0][1] == 1 ) && ( old_games[1][0][1] == 1 )){ // - > 이상한녀석 : 카운터덱으로 줘팸
			console.log("1 1");

				if( (old_games.length == 2) || (old_games[2][0][1] != 1)){ // 3번째 판 시작 했을때, 먼저 카운터 덱이라고 생각. 
											   // 4번째 판 부터, 만약에 3번째가 1이 아니면 - > 카운터덱 : 카운터의 카운터로 팸

					if( old_games[ old_games.length-1 ].length > history.length ){ // 전 게임 정보가 존재 하면
						return c_counter(old_games [ old_games.length-1 ][ history.length ][ 0 ]) // 전 게임에서 '내가 이번 순서에 낸 숫자'의 카운터의 카운터를 리턴
					}
					else{	// 전 게임 정보가 없으면

						return greedy(hands, history);

					}

				}
				else{ 						   // - > 계속 같은 덱 :  카운터덱으로 줘팸
					
					if(old_games[ old_games.length-1 ].length > history.length ){
						return counter(old_games [ old_games.length-1 ][ history.length ][ 1 ]); // 전 게임에서 '적이 이번 순서에 낸 숫자'의 카운터를 리턴
					}
					else{
						return greedy(hands,history);
					}
					

				}


		}

		if (( old_games[0][0][1] == 1 ) && ( old_games[1][0][1] != 1 )){ // - > 랜덤 : 54!312 로 줘팸
			console.log("1 !1");

				if (history.length == 0)
					return '5';
				if (history.length == 1)
					return '4';
				if (history.length == 2)
					return '!';
				if (history.length == 3)
					return '3';
				if (history.length == 4)
					return '1';
				if (history.length == 5)
					return '2';
			
		}

		if (( old_games[0][0][1] != 1 ) && ( old_games[1][0][1] == 1 )){ // - >  카운터 덱 : 카운터의 카운터로 줘팸
			console.log("!1 1");
			console.log("카운터 패러옴")
			console.log( old_games[ old_games.length-1 ].length );
			console.log( history.length );

			if(old_games[ old_games.length-1 ].length > history.length ){

				return c_counter(old_games [ old_games.length-1 ][ history.length ][ 0 ]); // 전 게임에서 '내가 이번 순서에 낸 숫자'의 카운터의 카운터를 리턴
			}
			else{
				return greedy(hands,history);
			}
			
		}

		if (( old_games[0][0][1] != 1 ) && ( old_games[1][0][1] != 1 )){  // - > 둘다 1이 아닌 경우는 생각해줘야함
			console.log("!1 !1");


				if( old_games[0][0][1] == old_games[1][0][1] ) // - > 똑같은녀석 : 카운터덱으뤄 줘팸
				{
					if(old_games[ old_games.length-1 ].length > history.length ){
						return counter(old_games [ old_games.length-1 ][ history.length ][ 1 ]); // 전 게임에서 '적이 이번 순서에 낸 숫자'의 카운터를 리턴
					}
					else{
						return greedy(hands,history);
					}
					

				}
				else{								 		   // - > 랜덤 :  54!312 로 줘팸


					if (history.length == 0)
						return '5';
					if (history.length == 1)
						return '4';
					if (history.length == 2)
						return '!';
					if (history.length == 3)
						return '3';
					if (history.length == 4)
						return '1';
					if (history.length == 5)
						return '2';


				}


			
		}





	}

	



	
}

