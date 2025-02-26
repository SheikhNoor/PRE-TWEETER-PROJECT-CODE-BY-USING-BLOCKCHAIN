// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
contract tweet{
//     address public functionCaller;
//     address public owner;   
 
//     string public text = '';
// constructor(){
//     owner = msg.sender;
// }

// function random() public{
//     functionCaller = msg.sender;
// }


    struct tweetContent{
        string content;
        address author;
        uint256 times;
    }

    tweetContent[] public tw;

    function postTweet(string memory _content) public{
        tweetContent memory newTweet = tweetContent({
            content: _content,
            author: msg.sender,
            times: block.timestamp
        });

        tw.push(newTweet);
    } 
    
    function viewPosts(uint256 _index) public view returns (string memory, address, uint256){ 
        require(_index < tw.length, "Index out of bounds");
        tweetContent memory t  = tw[_index];
        return (t.content, t.author,t.times);
        // tweetContent memory tw = tweetContent[_index];
        // string[] memory postString = new string[](2);
        // postString[0] = tw.content;
        // postString[1] = tw.author.toBase64();
    }
}
