<?php
class OrderController extends Zend_Controller_Action
{
	public function init() 
	{
		
		if(!Zend_Auth::getInstance()->hasIdentity()){
			$this->_redirect('/user/login/');
		}
		$cart= Cart::create();
		$count = $cart->getcount();
		
		/////если заказ оформлен то не перенаправлять
//		if($count<1){
//			$this->_redirect('/cart/');
//		}
		
	}
	public function step1Action()
	{
		if(!Zend_Auth::getInstance()->hasIdentity()){
			$this->_redirect('/');
		}
		$address = new Adress();
		
		
		$id_shipping=$this->_getParam('shipping',0);
		$id_billing=$this->_getParam('billing',0);
		
		
		if ($id_shipping > 0){
			$this->view->shipping=$shipping_address=$address->getAddres($id_shipping);
			if($id_billing>0){
				$this->view->billing=$address->getAddres($id_billing);
			}
			
		}
		
		
		$form_shipping = new App_Form_Address();
		$this->view->form_shipping = $form_shipping;
		$form_billing = new App_Form_Address();
		$this->view->form_billing = $form_billing;
		
		//todo добавление адресов
		
	}
	
	public function setaddressAction()
	{
		Zend_Layout::getMvcInstance()->disableLayout();
		$order = new Order();
		$order->setAddress((int) $this->_getParam('id', '0'));
		//Zend_Debug::dump($_SESSION);
	}
	
	public function setmethodAction()
	{
		Zend_Layout::getMvcInstance()->disableLayout();
		$order = new Order();
		$order->setShippingMethod($this->_getParam('id',0));
	}
	
	public function setpaymentAction()
	{
 		Zend_Layout::getMvcInstance()->disableLayout();
		$payment_id= $this->_getParam('id',0);
		if ($payment_id>0) {
			$order = new Order();
			$order->setPaymentMethod($payment_id);
			$order->updatePayment();
		}
	
	}
	
	public  function step2Action()
	{
		$this->view->form=$form=new App_Form_ShippingMethod();
		$shipping= new Shipping();
		$this->view->methods=$methods= $shipping->fetchAll();
	}
	
	public function step3Action() {
		
		$order= new Order();
		$select = $order->getAdapter()->select()
		->from('shipping_method')->
		where("id = ?" , $_SESSION['shipping']);
		$this->view->method=$shipping_method= $order->getAdapter()->fetchRow($select);
		
		
		$cart= Cart::create();
		$products = $this->view->products = $cart->getProducts();
		$sub_price=0;
		foreach ($products as $product) {
			$sub_price+=$product['price']*$product['count'];
		}
		
		$this->view->subprice=$sub_price;
		
		
		$address = new Adress();
		
		$shipping_address=$address->get(1);
		$billing_address =$address->get();
		if (!count($billing_address)) {
			$billing_address=$shipping_address;
		}
		
		

		
		$this->view->bill_address=$billing_address;
		$this->view->ship_address=$shipping_address;
		
		
		$confirm = $this->_getParam('confirm',0);
		if($confirm){
			$order->confirm();
			$this->_redirect('/order/step4/');
		}
				
	}
	
	
	
	
	public function step4Action()
	{

		$payment= new Payment();
		$this->view->payments=$payment->fetchAll();
		
		
	}
	
	
	public function trackAction() 
	{
		
		if($this->getRequest()->isPOST()){
			$mail=$_POST['mail'];
			$number=$_POST['number'];
			
			$mailValid= new Zend_Validate_EmailAddress();
			$numberValid= new Zend_Validate_Digits();
		
			if($mailValid->isValid($mail) and $numberValid->isValid($number)){
				$order = new Order();
				$status =$order->track($mail,$number);	
				
				if ($status){
					$this->view->status=$status;
				}else{
					$this->view->status='error';
				}
					
						
			}
		}
	}
	
}