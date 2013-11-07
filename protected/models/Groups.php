<?php

class Groups extends MainGroups
{
	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 *
	 * @param string $className active record class name.
	 *
	 * @return MainGroups the static model class
	 */
	public static function model($className = __CLASS__)
	{
		return parent::model($className);
	}
}