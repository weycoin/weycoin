// Copyright (c) 2017-2018 WEYCOIN developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef WEYCOIN_QT_WEYCOINADDRESSVALIDATOR_H
#define WEYCOIN_QT_WEYCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class WeyCoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit WeyCoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** WeyCoin address widget validator, checks for a valid weycoin address.
 */
class WeyCoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit WeyCoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // WEYCOIN_QT_WEYCOINADDRESSVALIDATOR_H
