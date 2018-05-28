$(document).ready(function () {
  $("#new_doctor").validate(
  {
    debug: false,

    //error place
    errorPlacement: function (error, element) {
    error.insertAfter(element);
    },

    //adding rule
    rules: {  
      "doctor[name]":{ required: true, maxlength: 20, lettersonly: true },
      "doctor[ph_no]": {required: true, digits: true, rangelength: [10, 10], remote:'/doctors/check_phone' },
      "doctor[salary]": { required: true, number: true}

    },
    
    // error messages
    messages: {
      "doctor[name]": { required:  "*Name can`t be blank", maxlength: "*Name can't be longer than 20 letters", number: "you  can't enter number in name" },
      "doctor[ph_no]": { required: "*Ph No can`t be blank", rangelength: "*Please enter 10 digit phone number", remote: "Already exist"},
      "doctor[salary]": { required: "*Salary can't be blank"}
    }
    
  });
});
jQuery.validator.addMethod("lettersonly", function(value, element) 
{
return this.optional(element) || /^[a-z ]+$/i.test(value);
}, "*Letters and spaces only please");