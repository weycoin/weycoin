## REMOTE MASTERNODE BUILD NOTES

#### System requirements

##### Remote:
An Ubuntu 16.04 64bit server is recommended with at least 768MB
of memory and 10GB space available when running a Masternode.

##### Local:
Windows 7 64 bit or newer, or Ubuntu 16.04 64bit Desktop.
At least 2048MB of memory and 10GB space available for chain data.

________________________________________________________________________________

#### Local Machine

Note that the following steps can be performed via command line using the *weycoin-cli*
instead of using the WEYCOIN Qt wallet.

1.  Download latest version of WEYCOIN Qt client for windows or linux

        https://github.com/weycoin/weycoin/releases

2.  Create weycoin.conf file with the following contents:

```
rpcallowip=127.0.0.1
rpcuser=YourUserName
rpcpassword=YourRPCPassword
server=1
daemon=1
listen=1
```

    Place the configuration file in its correction location:

    For Linux: ${HOME}/.weycoin/weycoin.conf
    For Windows: %appdata%\weycoin.conf

3.  Start WEYCOIN Qt gui client and allow the chain to sync

4.  Go to Help --> Debug Window --> Console and enter: `getaccountaddress 0`
    Copy the generated address to a text file.

5.  In the console enter: `masternode genkey`
    Copy the generated private key to a text file.

5.  Send exactly 15,000 WAE in a single transaction to the address generated from Step 4

6.  After you have received the WAE from Step 5, go to Help --> Debug Window --> Console and enter: `masternode outputs`

    You should see output similar to below indicating that the node has recognised coins as eligible to be used
    as collateral for a Masternode.

```
{
  "d565175089b0f4dce2294dc003799ae0c9cb703cadd996a0a4224458f176eb6e": "0"
}
```

7.  Shutdown the WEYCOIN Qt wallet

8.  Modify the weycoin.conf and add the lines noted here:

```
rpcallowip=127.0.0.1
rpcuser=YourUserName
rpcpassword=YourRPCPassword
server=1
daemon=1
listen=1
# **** add the following new lines ****
maxconnections=256
masternode=1
masternodeprivkey=<your_private_key_generated_in_step_5>
externalip=<external_ip_of_your_remote_node>:11526
promode=1
```

#### Remote Machine

1.  Download latest version of WEYCOIN linux amd64 release

        https://github.com/weycoin/weycoin/releases
2.  Create weycoin.conf file with the following contents:

```
rpcallowip=127.0.0.1
rpcuser=YourUserName
rpcpassword=YourRPCPassword
server=1
daemon=1
listen=1
maxconnections=256
promode=1
```    

3.  Create masternode.conf file in the same directory as your wallet.dat.  The masternode.conf
    format consists of a space seperated text file. Each line consisting of an alias, ip address
    followed by port, masternode private key, collateral output transaction id and collateral
    output index (matching the result of Local Machine Step 6)

```
alias 127.0.0.1:11526 masternode_private_key collateral_output_txid collateral_output_index

e.g.

mn01 127.0.0.1:11526 92bHZcSpmT6UinHzR8VgaVZVgBVfbDRCh1WogXXXXXXtf9pyZ4Y d565175089b0f4dce2294dc003799ae0c9cb703cadd996a0a4224458f176eb6e 0
```

4.  Start WEYCOIN daemon using command `./weycoind`; you should get the following output:

```
Missing masternode input, please look at the documentation for instructions on masternode creation
```

5.  Then enter the following command using *weycoin-cli*

```
./weycoin-cli masternode debug
```

#### Local Machine

1.  Back on your local machine; start the WEYCOIN Qt client

2.  Go to Help --> Debug Window --> Console and enter: `masternode start`
    You should get the following message:

```
successfully started masternode
```

3.  If you then enter: `masternodelist`
    You should be able to locate the externalip of your remote node from the
    output list of masternodes.

    **Congratulations your masternode is up and running!**

    Alternatively, on the WEYCOIN Qt client Masternodes tab --> All Masternodes you should see your
    remote node ip address listed with its public key and other data


3.  You can now shutdown your local "cold" wallet
