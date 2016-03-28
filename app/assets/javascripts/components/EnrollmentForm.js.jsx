class EnrollmentForm extends React.Component {
    constructor(props){
        super(props);
        this.items = props.items;
        this.data = {};
        this.state = {clicked: 0};
    }

    indexChange(index){
        this.setState({clicked: index})
    }

    updateSection(){
        var index = this.state.clicked;
        var length = this.items.length;
        if( index < length-1)
            this.setState({clicked: this.items.indexOf(this.items[index + 1]) || this.state.clicked});
    }
    clickNextButton(e){
        e.preventDefault();
        this.updateSection();

    }

    getPercentage(){
        var percents = '69';
        return percents + '% ';
    }

    getProgress(){
        return ( this.state.clicked + 1).toString() + '/' + this.items.length.toString() + ' ';
    }

    nextButtonLabel(){
        var index = this.state.clicked +1;

        if(index != this.items.length) {
            return 'Next section →';
        } else {
            return 'Save ✓';
        }
    }

    updatePercentage(){

    }

    updateSectionData(data){
        this.data[data.type] = data;
    }

    render(){
        return (
            <div>
                <FormMenu items={ this.props.items }
                          clicked={ this.state.clicked }
                          onIndexChange={ this.indexChange.bind(this) } />
                { this.renderSection(this.props.items[this.state.clicked]) }
                <div className="row">
                    <div className="col-md-10">
                        <div className="progress">
                            <div className="progress-bar progress-bar-success progress-bar-striped"
                                 role="progressbar"
                                 aria-valuenow="40"
                                 aria-valuemin="0"
                                 aria-valuemax="100"
                                 style={{width: this.getPercentage()}}>
                                { this.getPercentage() + 'Complete' }
                            </div>
                        </div>
                    </div>
                    <div className="col-md-2">
                        <a href='#' className="btn btn-success" onClick={ this.clickNextButton.bind(this) }>
                            {this.getProgress() + this.nextButtonLabel()}
                        </a>
                    </div>
                </div>
            </div>
        );
    }


    renderSection(item){
        switch (item){
            case 'Basics':
                return (<BasicsSection updateData={ this.updateSectionData.bind(this) }
                                       values={ this.data.Basics }
                                       updatePercentage={ this.updatePercentage.bind(this) }
                />);
            case 'Contacts':
                return (<ContactsSection updateData={ this.updateSectionData.bind(this) }
                                         values={ this.data.Contacts }
                                         updatePercentage={ this.updatePercentage.bind(this) }
                />);
            case 'Extra':
                return (<ExtraSection updateData={ this.updateSectionData.bind(this) }
                                      values={ this.data.Extra }
                                      updatePercentage={ this.updatePercentage.bind(this) }
                />);
            case 'Medications':
                return (<MedicationsSection updateData={ this.updateSectionData.bind(this) }
                                            values={ this.data.Medications }
                                            updatePercentage={ this.updatePercentage.bind(this) }
                />);
            case 'Allergies':
                return (<AllergiesSection updateData={ this.updateSectionData.bind(this) }
                                          values={ this.data.Allergies }
                                          updatePercentage={ this.updatePercentage.bind(this) }
                />);
            case 'Questionnaire':
                return (<QuestionnaireSection updateData={ this.updateSectionData.bind(this) }
                                              values={ this.data.Questionnaire }
                                              questions={ this.props.questions }
                                              updatePercentage={ this.updatePercentage.bind(this) }
                />);
            case 'Signature':
                return (<Signature updateData={ this.updateSectionData.bind(this) }
                                   values={ this.data.Signature }
                />);
            default:
                return (<ErrorPage/>);
        }
    }
}