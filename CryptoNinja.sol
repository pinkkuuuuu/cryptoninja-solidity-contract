// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CryptoNinja is Ownable{
    address tokenAddress;

    struct Game{
        address player1;
        address player2;
        uint256 bidPrice ;
        }    

        Game game;
        address winner;
constructor(address _tokenAddress){
    tokenAddress = _tokenAddress;
    game = Game(address(0),address(0),9*10**18);
}

function updateToken(address _tokenAddress)public{
        tokenAddress = _tokenAddress;
    }

      function startGame()public{
          require(msg.sender != address(0),"address is not valid");
        ERC20(tokenAddress).transferFrom(msg.sender, address(this), game.bidPrice);
          if(game.player1 == address(0)){
              game.player1 = msg.sender;
          }

          else if(game.player2 == address(0)){
              game.player2 = msg.sender;
          }

          else{
               revert("The game is already Full");
          }
      }

     function setWinner(address _winner)public onlyOwner{
        require(game.player1 == _winner || game.player2 == _winner,"address is not a player");
            winner = _winner;
     }

     function collect()public{
        require(winner == msg.sender,"sender is not winner");
         ERC20(tokenAddress).transfer(msg.sender,game.bidPrice * 2 *9/10);
         game = Game(address(0),address(0),9*10**18);
     }
 
      }         

