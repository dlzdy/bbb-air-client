package org.bigbluebutton.command {
	
	import org.bigbluebutton.core.IVideoConnection;
	import org.bigbluebutton.model.IConferenceParameters;
	import org.bigbluebutton.model.IUserSession;
	import org.bigbluebutton.model.IUserUISession;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class ConnectVideoCommand extends Command {
		
		[Inject]
		public var userSession:IUserSession;
		
		[Inject]
		public var userUISession:IUserUISession;
		
		[Inject]
		public var conferenceParameters:IConferenceParameters;
		
		[Inject]
		public var videoConnection:IVideoConnection;
		
		override public function execute():void {
			videoConnection.uri = userSession.config.getConfigFor("VideoConfModule").@uri + "/" + conferenceParameters.room;
			//TODO use proper callbacks
			//TODO see if videoConnection.successConnected is dispatched when it's connected properly
			videoConnection.successConnected.add(successConnected)
			videoConnection.unsuccessConnected.add(unsuccessConnected)
			videoConnection.connect();
		}
		
		private function successConnected():void {
			userSession.videoConnection = videoConnection;
		}
		
		private function unsuccessConnected(reason:String):void {
			userUISession.loading = false;
			userUISession.unsuccessJoined.dispatch("connectionFailed");
		}
	}
}
