$(document).ready(function() {
  $('#fiendsearch_form').on("click", function (e) {
      e.preventDefault();
      var frinedemail=document.getElementById("fiendsearch").value
      var content="";

      $.ajax({
          type:"GET",
          url:"addFriendtoOrder",
          dataType:"json",
         // data: {user_id: userid},
         // data: {group_name: userid},
          data: {friend_email: frinedemail},
          success:function(result){
          
            content ='<tr id="'+result.id+'"><td>'+result.id+
            '</td><td>'+result.full_name+'</td><td>'+result.email+'</td><td><button class="btn btn-danger" id="removefriend'+result.id+'">remove</button><td></tr>' ;
            $('#orderfriends').last().append(content);
          
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
            success:function(result){

            //  ---------------group-----------------
             result=result.friends
            for(i=0;i<result.length;i++){
                content ='<tr id="'+result[i].id+'"><td>'+result[i].id+
                '</td><td>'+result[i].full_name+'</td><td>'
                +result[i].email+'</td><td><button class="btn btn-danger" id="removefriend'
                +result[i].id+'">remove</button><td></tr>' ;
                $('#orderfriends').last().append(content);
            }
            
            }
          });
          
    });
  });

