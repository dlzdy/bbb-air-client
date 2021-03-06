package org.bigbluebutton.view.navigation.pages.participants {
	
	import spark.components.Button;
	import spark.components.List;
	import spark.components.supportClasses.SkinnableComponent;
	
	public class ParticipantsView extends ParticipantsViewBase implements IParticipantsView {
		//private var _buttonTestSignal: Signal = new Signal();
		//public function get buttonTestSignal(): ISignal
		//{
		//	return _buttonTestSignal;
		//}
		override protected function childrenCreated():void {
			super.childrenCreated();
			//this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function get list():List {
			return participantslist;
		}
		
		public function get guestsList():List {
			return guestslist;
		}
		
		public function get allGuests():SkinnableComponent {
			return allguests;
		}
		
		public function get allowAllButton():Button {
			return allowAllButton0;
		}
		
		public function get denyAllButton():Button {
			return denyAllButton0;
		}
		
		/*
		   public function onClick(e:MouseEvent):void
		   {
		   //buttonTestSignal.dispatch();
		   }
		 */
		public function dispose():void {
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
	}
}
