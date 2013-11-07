<?php
/**
 * @var Accounts $model
 * @var Accounts $data
 */

$this->widget(
	'zii.widgets.grid.CGridView',
	array(
		'dataProvider' => $model->search(),
		'columns' => array(
			'server_account',
			array(
				'name' => 'group.name',
				'header' => 'Group name',
			),
			array(
				'header' => 'Server name (Server type)',
				'value' => function ($data) {
						return $data->group->server->name . ' (' . $data->group->server->server_type . ')';
					},
			),
			array(
				'header' => 'Validation',
				'value' => function ($data) {
						$serverExt = 'Server' . $data->group->server->server_type . 'Ext';

						return Yii::app()->$serverExt->check($data->group->server->settings, $data->server_account);
					},
			),
		),
	)
);