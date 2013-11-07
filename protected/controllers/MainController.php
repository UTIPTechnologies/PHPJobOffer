<?php

class MainController extends CController
{
	public function actionIndex()
	{
		$this->render('/main', array('model' => new Accounts()));
	}
}