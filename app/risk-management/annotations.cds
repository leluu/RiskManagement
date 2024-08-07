using RiskService as service from '../../srv/risk-service';
using from '../../db/schema';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>RiskOverview}',
            ID : 'i18nRiskOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>RiskDetails}',
                    ID : 'i18nRiskDetails',
                    Target : '@UI.FieldGroup#i18nRiskDetails',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>MitigationOverview}',
            ID : 'i18nMitigationOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>MitigationDetails}',
                    ID : 'i18nMitigationDetails',
                    Target : '@UI.FieldGroup#i18nMitigationDetails',
                },],
        },],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>PriorityCode}',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Description}',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            Criticality : criticality,
        },
    ],
);

annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
    }
};

annotate service.Risks with @(
    UI.SelectionFields : [
        prio_code,
        impact,
        owner,
    ]
);

annotate service.Risks with {
    prio @Common.Label : '{i18n>Priority}'
};
annotate service.Risks with @(
    UI.HeaderFacets : [],
    UI.FieldGroup #i18nTitle : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Risks with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    }
);
annotate service.Risks with @(
    UI.FieldGroup #i18nRiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title}',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Owner}',
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : '{i18n>Description}',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : PrioCriticality,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #i18nMitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti.createdAt,
            },{
                $Type : 'UI.DataField',
                Value : miti.createdBy,
            },{
                $Type : 'UI.DataField',
                Value : miti.descr,
                Label : '{i18n>Description}',
            },{
                $Type : 'UI.DataField',
                Value : miti.modifiedAt,
            },{
                $Type : 'UI.DataField',
                Value : miti.modifiedBy,
            },{
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : '{i18n>Owner}',
            },{
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : '{i18n>Timeline}',
            },],
    }
);
annotate service.Priority with {
    code @Common.Label : '{i18n>PriorityCode}'
};
annotate service.Risks with {
    PrioCriticality @Common.Label : '{i18n>PriorityCriticality}'
};
annotate service.Risks with {
    impact @Common.Label : '{i18n>Impact}'
};
annotate service.Risks with {
    criticality @Common.Label : '{i18n>Criticality}'
};
annotate service.Risks with {
    owner @Common.Label : '{i18n>Owner}'
};
annotate service.Risks with {
    impact @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Risks',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : impact,
                    ValueListProperty : 'impact',
                },
            ],
            Label : '{i18n>Impactvh}',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Risks with {
    owner @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Risks',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : owner,
                    ValueListProperty : 'owner',
                },
            ],
            Label : '{i18n>Ownervh}',
        },
        Common.ValueListWithFixedValues : false)};
annotate service.Risks with {
    prio @Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
