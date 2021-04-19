

//appned all rows id to array(n.b row is unique by friend id)
currentFriends=[]
//var uniqueItems=[] ;
function checkrows(){
   $('.orderfriendtable > tbody  > tr').each(function(index, tr) { 
         currentFriends.push(tr.id)
        
  });
  uniqueItems = [...new Set(currentFriends)]
  return uniqueItems;
}

//check if current id exist in all ids array
function checkForMatch(array, valueToMatch){
  for(var i = 0; i < array.length; i++){
      if(array[i] == valueToMatch)
          return true;
  }
  return false;
}


$(document).ready(function() {
  $('#fiendsearch_form').on("click", function (e) {
      e.preventDefault();
      var frinedemail=document.getElementById("fiendsearch").value
      var content="";

      $.ajax({
          type:"GET",
          url:"addFriendtoOrder",
          dataType:"json",

          data: {friend_email: frinedemail},
          success:function(res){
            friendsids=checkrows();
            //check if current row id already exist
            //res[1] -> user object , res[0] -> friend id
            result=res[1]
                if (!checkForMatch(friendsids,res[0])) {
                      content ='<tr class="card" id="'+res[0]+'"><>'+res[0]+
                      '</td><td class="card-header">'+result.full_name+'</td><td>'+
                      result.email+'</td><td><button class="btn btn-danger" id="removefriend'+
                      res[0]+'">remove</button><td></tr>' ;
                      $('#orderfriends').last().append(content);
                }
                allIds()
          }
        });
        
  });
});

$(document).ready(function() {
    $('#groupsearch_form').on("click", function (e) {
        e.preventDefault();
        var groupname=document.getElementById("groupsearch").value
        var content="";

        $.ajax({
            type:"GET",
            url:"addGrouptoOrder",
            dataType:"json",
           data: {group_name: groupname},
            success:function(res){
              
             

            //  ---------------group-----------------
             result=res[1].friends
            for(i=0;i<result.length;i++){
            //  console.log(res[0].friendsid[i])
                friendsids=checkrows();
              //check if current row id already exist
                  if (!checkForMatch(friendsids,res[0].friendsid[i])) {
                    content ='<tr id="'+res[0].friendsid[i]+'"><td>'+res[0].friendsid[i]+
                    '</td><td>'+result[i].full_name+'</td><td>'
                    +result[i].email+'</td><td><button class="btn btn-danger" id="removefriend'
                    +res[0].friendsid[i]+'">remove</button><td></tr>' ;
                    $('#orderfriends').last().append(content);
                }
            }
            allIds()
            }
          });
          
    });
  });

 function allIds(){
        formData=checkrows();
        // console.log('thisis',formData)
            $.ajax({
              type: 'GET',
              url: "order_friend_params",
              dataType: 'json',
              data: {formData: formData},
        
          })
}
