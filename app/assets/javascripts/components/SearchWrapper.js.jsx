class SearchWrapper extends React.Component{

    constructor(props){
        super(props);
        this.state = {didFetchData: false, page: 1, results: props.results};
    }

    componentDidMount(){
        window.addEventListener('scroll', this.handleScroll.bind(this));
    }

    handleScroll(){
        if ($(window).scrollTop() > $(document).height() - $(window).height() - 60){
            this.state.page++;
            this.fetchResults({all: true, page: this.state.page});
        }
    }

    fetchResults(params){
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: this.props.action,
            data: {
                query: params.query,
                page: params.page
            },
            success: (data) => {
                var tmp = this.state.results;
                if (params.all) {
                    data.forEach((item) => {
                        tmp.push(item);
                    });
                    this.setState({didFetchData: true, results: tmp})
                }
                else{
                    tmp = [];
                    this.setState({didFetchData: true, results: data})
                }
            }
        });
    }

    handleOnSearchSubmit(search){
        if (search == ''){
            this.state.results = [];
            this.state.page = 1;
            this.fetchResults({query: search, all: true});
        }
        else {
            this.fetchResults({query: search, all: false});
        }
    }

    render(){
        return(<div className="row">
            <div className="col-lg-12">

                <div className="col-lg-8">
                    <h1>
                        {this.props.name}
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
                                    {'Edit ' + this.props.name + ' below'}
                                </div>
                            </div>
                            <div className="col col-xs-6 text-right">
                                <a className="btn btn-sm btn-primary" href={this.props.action + '/new'}>{'New ' + this.props.name}</a>
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
