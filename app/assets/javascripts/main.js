$(document).on('change', '.woocommerce-ordering', function() {
  $(this).submit();
});

$(document).on('click', '.mike-cart-remove-item-btn', function(event){
  event.preventDefault();
  $(this).closest('tr').find('.mike-cart-service').val('remove');
  $(this).closest('tr').find('form').submit();
});

$(document).on('blur', '.mike-cart-form-qty', function(){
  $(this).closest('form').find('.mike-cart-service').val('update');
  $(this).closest('form').submit();
});
