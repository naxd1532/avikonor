<?php
/*
 * Copyright (C) 2009 Igalia, S.L. <info@igalia.com>
 *
 * This file is part of PhpReport.
 *
 * PhpReport is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * PhpReport is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with PhpReport.  If not, see <http://www.gnu.org/licenses/>.
 */


/** File for GetTaskSectionAction
 *
 *  This file just contains {@link GetTaskSectionAction}.
 *
 * @filesource
 * @package PhpReport
 * @subpackage facade
 * @author Jorge López Fernández <jlopez@igalia.com>
 */

include_once(PHPREPORT_ROOT . '/model/facade/action/Action.php');
include_once(PHPREPORT_ROOT . '/model/dao/DAOFactory.php');


/** Get Task Section Action
 *
 *  This action is used for retrieving a Task Section.
 *
 * @package PhpReport
 * @subpackage facade
 * @author Jorge López Fernández <jlopez@igalia.com>
 */
class GetTaskSectionAction extends Action{

    /** The Task Section id
     *
     * This variable contains the id of the Task Section we want to retieve.
     *
     * @var int
     */
    private $id;

    /** GetTaskSectionAction constructor.
     *
     * This is just the constructor of this action.
     *
     * @param int $id the database identifier of the Task Section we want to retieve.
     */
    public function __construct($id) {
        $this->id = $id;
        $this->preActionParameter="GET_TASK_SECTION_PREACTION";
        $this->postActionParameter="GET_TASK_SECTION_POSTACTION";

    }

    /** Specific code execute.
     *
     * This is the function that contains the code that retrieves the Task Section from persistent storing.
     *
     * @return TaskSectionVO the Task Section as a {@link TaskSectionVO} with its properties set to the values from the row.
     */
    protected function doExecute() {

        $dao = DAOFactory::getTaskSectionDAO();

        return $dao->getById($this->id);

    }

}


/*//Test code;

$action= new GetTaskSectionAction(1);
var_dump($action);
$result = $action->execute();
var_dump($result);
*/
