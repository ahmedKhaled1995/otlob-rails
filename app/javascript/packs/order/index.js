  $(document).ready(function() {
    $('#my_form').on("click", function (e) {
        e.preventDefault();
        var userid=document.getElementById("search").value
        var content="";

        $.ajax({
            type:"GET",
            url:"addFriendtoOrder",
            dataType:"json",
            data: {user_id: userid},
            //data: {friend_email: userid},
            success:function(result){
            for(i=0;i<result.length;i++){
                content ='<tr><td>'+result[i].id+
                '</td><td>'+result[i].name+'</td><td>'+result[i].email+'</td><td><button class="btn btn-danger" id="removefriend'+result[i].id+'">remove</button><td></tr>' ;
                $('#orderfriends').last().append(content);

            }
            }
          });
          
    });
  });

//   Rails.ajax({
//     url: "/friends",
//     type: "get",
//     data: "",
//     success: function(data) {},
//     error: function(data) {}
//   })



// const { data } = require("jquery");
// //   $(document).ready(function() {
    
//     $('#my_form').on("click", function (event) {
//       // console.log('hello')
       
//          ajaxcall() 
//      });
//     //         event.preventDefault();
//     // $(document).on('click', '#my_form', function (e){


//     // });
//     function ajaxcall(){
//         var friendid=document.getElementById("search").value
//         var content="";   
//         $.ajax({
//             type:"GET",
//             url:"orders/test",
//             dataType:"json",
//             data: {some_parameter: friendid},
//             success:function(result){
//             //   $('#orderfriends').append('hello');

//             for(i=0;i<result.length;i++){
//                 // alert("friend id: "+result[i].id+"\nfriend email: "+result[i].email)
//                 // content = result[i].id;
//                 // content += "<br>";
//                 // // $('#orderfriends').html(content);
//                 // $('#orderfriends').last().append('<div class="friend">' + content + '</div>');

//               //  $(content).appendTo("#orderfriends");

//                console.log("group id: "+result[i].id+"\ngroup name: "+result[i].name)

//             }


//             // $.each(result, function(i, value) {
//             //     console.log('Value of '+ i +' is : ' + value);
//             //  })

//              // alert(result)
//             }
//           });
//     }

