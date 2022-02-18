
<?php   
        try { 
            require_once('database_connection.php');
            
            //taking date inputs from the form
            $from_date = $_POST['date_from'];
            $to_date = $_POST['date_to'];
            if (isset($_POST["download_report"])) {
                if (!empty($_POST['columns'])) { //from columns[] of the form.[] means that S_POST is an array
                    //For mysql query: implode returns a string from an array, delimiting by a separator if specified.
                    $columns_database = implode(",", $_POST['columns']);
                    
                    //array of columns without Date_Time
                    //$columns_array = array($columns_database); 
                    $columns_array = $_POST['columns'];

                    //Instructions to save a generated file, with header() function
                    header('Content-Type:text/csv; charset=latin1');
                    header('Content-Disposition: attachment; filename="register.csv"');

                    //File output.Write directly to php output instead of buffering the CSV data in memory
                    $output = fopen('php://output','w');//php://output allows to write to output buffer as print or echo

                    //Headers
                    $output_row = $columns_array;
                    array_unshift($output_row,"Date_Time"); //Date_Time is now the first element
                    fputcsv($output, $output_row);

                    //instruction to get the data from the database
                    $selectioncommand = "SELECT Date_Time,$columns_database FROM testdata_1 where Date_Time BETWEEN '$from_date' and '$to_date'";
                    //executing the insertion with query
                    $register_csv = mysqli_query($connectdb,$selectioncommand); 
                    //same: $register_csv = $connectdb->query($selectioncommand); 

                    //inserting rows
                    while($row_register = $register_csv->fetch_assoc()) { //fetch_assoc:fetch 1st element data got by the query
                        $output_row = [];
                        $output_row = array($row_register["Date_Time"]);
                        for ($i=0; $i<count($columns_array); $i++){ 
                            array_push($output_row,$row_register[$columns_array[$i]]); //array_push adds elements to array
                        }
                        fputcsv($output,$output_row);
                    }
                }
                else{
                    $message = "No column is selected!";
                    echo "<script type='text/javascript'>alert('$message');</script>";
                }

                
            }

            //important to close
            mysqli_close($connectdb);
        }
        catch (Exception $exc) { // \Exception?
            echo $exc->getMessage();
        }
    ?>
