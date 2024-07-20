abstract class CartEvent {
  const CartEvent();
  
  List<Object> get props => [];
}

class GetCartsEvent extends CartEvent {
  @override
  List<Object> get props => [];
}
