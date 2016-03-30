class SearchWrapper extends React.Component{

    constructor(props){
        super(props);
        this.fetchResults('');
        this.state = {didFetchData: false, results: []}
    }

    fetchResults(data){
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: this.props.action,
            data: {
                query: data['query']
            }
        }).success(this.fetchDataSuccess.bind(this));
    }

    fetchDataSuccess(data){
        this.setState({didFetchData: true, results: data})
    }


    handleOnSearchSubmit(search){
        this.fetchResults({query: search});
    }

    render(){
        return(<div className="row">
            <div className="col-lg-12">

                <div className="col-lg-8">
                    <h1>
                        School Groups
                    </h1>
                </div>
                <div className="col-lg-4">
                    <br/>
                        <SearchLine onFormSubmit={this.handleOnSearchSubmit.bind(this)}/>
                </div>
                <div className="panel panel-default panel-table">
                    <div className="panel-heading">
                        <div className="row">
                            <div className="col col-xs-6">
                                <div className="h3 panel-title">
                                    Edit school groups below
                                </div>
                            </div>
                            <div className="col col-xs-6 text-right">
                                <a className="btn btn-sm btn-primary" href="/school_groups/new">New School group</a>
                            </div>
                        </div>
                    </div>
                    <div className="panel-body">
                        <SearchResults results={this.state.results} action={this.props.action}/>
                    </div>
                </div>
            </div>
        </div>);
    }
}
