<style type="text/css">
    table { 
        width: 100%; 
        color: #717375; 
        font-family: helvetica; 
        line-height: 5mm; 
        border-collapse: collapse; 
    }
    h2 { margin: 0; padding: 0; }
    p { margin: 5px; }
 
    .border th { 
        border: 1px solid #000;  
        color: white; 
        background: #000; 
        padding: 5px; 
        font-weight: normal; 
        font-size: 14px; 
        text-align: center; 
        }
    .border td { 
        border: 1px solid #CFD1D2; 
        padding: 5px 10px; 
        text-align: center; 
    }
    .no-border { 
        border-right: 1px solid #CFD1D2; 
        border-left: none; 
        border-top: none; 
        border-bottom: none;
    }
    .space { padding-top: 250px; }
 
    .10p { width: 10%; } .15p { width: 15%; } 
    .30p { width: 30%; } .50p { width: 50%; } 
    .60p { width: 60%; } .70p { width: 70%; }
</style>

<page backtop="10mm" backleft="10mm" backright="10mm" backbottom="10mm" footer="page;">
 
    <page_footer>
        <hr />
        <p>Fait a Paris, le <?php echo date("d/m/y"); ?></p>
        <p>Signature du particulier, suivie de la mension manuscrite "bon pour accord".</p>
        <p>&nbsp;</p>
    </page_footer>
 
    <table style="vertical-align: top;">
        <tr>
            <td class="70p">
                <strong><?php echo $this->Model['firstname']." ".$this->Model['lastname']; ?></strong><br />
                <?php echo nl2br($this->Model['address']); ?><br/><?php echo nl2br($this->Model['zipcode']) . ' ' . nl2br($this->Model['city']); ?><br />
                <strong>SIRET:</strong> <?php echo $this->Model['companySiret']; ?><br />
                <?php echo $this->Model['email'] . " / " . $this->Model['phoneNumber']; ?>
            </td>
            <td class="30p">
                <strong><?php echo $this->Model['fromCompany']; ?></strong><br />
                7 boulevard Aristide Briand<br/>
                92400 Courbevoie
            </td>
        </tr>
    </table>
 
    <table style="margin-top: 50px;">
        <tr>
            <td class="70p"><h2>Devis n°<?php echo $this->Model["id"]; ?></h2></td>
            <td class="30p">Emis le <?php echo date("d/m/y"); ?></td>
        </tr>
        <tr>
            <td style="padding-top: 15px;" colspan="2"><strong>Objectif:</strong> <?php echo $this->Model['projectName']; ?></td>
        </tr>
    </table>
    
    <table style="margin-top: 30px;" class="border">
        <thead>
            <tr>
                <th class="20p">Menu</th>
                <th class="60p">Plat</th>
                <th class="10p">Quantité</th>
                <th class="10p">Prix unitaire</th>
            </tr>
        </thead>
        <tbody>
            <?php $total = 0; $cpt = true; foreach ($this->Model["cart"] as $menu): ?>
            <?php foreach ($menu["meals"] as $meal): ?>
                <tr>
                    <?php if($cpt): ?> 
                        <td style="width:20%;" rowspan="<?php echo count($menu["meals"]); ?>"><?php echo $menu['menu']->getName(); ?></td>
                    <?php endif ?>
                    <td style="width:60%;"><?php echo $meal['meal']->getDescription(); ?></td>
                    <td style="width:10%;"><?php echo $meal['quantity']; ?></td>

                    <?php if($cpt): ?> 
                        <td style="width:10%;" rowspan="<?php echo count($menu["meals"]); ?>"><?php echo $menu['price'];$total += ($menu['price'] * $meal['quantity']); ?>€</td>
                    <?php $cpt = false; endif ?>
                </tr>
            <?php endforeach ?>
            <?php $cpt = true; endforeach ?>    
            <!-- <tr>
                <td class="space"></td>
                <td></td>
                <td></td>
            </tr> -->

            <tr>
                <td colspan="2" class="no-border"></td>
                <td style="text-align: center;"><strong>Livraison:</strong></td>
                <td><?php echo ($this->Model["fees"] == 0 ? "Offert" : ($this->Model["fees"] > 0 ? $this->Model["fees"]." €" : "à consulter")); ?></td>
            </tr>
 
            <tr>
                <td colspan="2" class="no-border"></td>
                <td style="text-align: center;" rowspan="3"><strong>Total:</strong></td>
                <td>HT : <?php echo $total; ?> &euro;</td>
            </tr>
            <tr>
                <td colspan="2" class="no-border"></td>
                <td>TVA : <?php echo (($total*1.2) - $total); ?> &euro;</td>
            </tr>
            <tr>
                <td colspan="2" class="no-border"></td>
                <td>TTC : <?php echo ($total*1.2); ?> &euro;</td>
            </tr>
        </tbody>
    </table>
</page>
