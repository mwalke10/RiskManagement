namespace RiskManagement;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Risks : managed
{
    key ID : UUID;
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    mitigations : Association to one Mitigations;
    Supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
    miti_id : UUID;
}

entity Mitigations : managed
{
    key ID : UUID;
    Description : String(100);
    Owner : String(100);
    Timeline : String(100);
    risks : Association to many Risks on risks.mitigations = $self;
}
